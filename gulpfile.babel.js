import dotenv from "dotenv";
import gulp from "gulp";
import algoliasearch from "algoliasearch";
import markdown2json from "markdown2json";

dotenv.config();

gulp.task("default", () => {

    let client = algoliasearch(process.env.ALGOLIA_API_KEY, process.env.ALGOLIA_API_SECRET);
    let algolia = client.initIndex(process.env.ALGOLIA_INDEX);

    let indexer = new markdown2json.Indexer(
        {
            "dir": "./content",
            "index_empty_content": false, //if md content == "", is not indexed
            "excludeIfProps": ["my_custom_prop"],
            "cleanMD": true,
            "removeProps": ["image"],
            "excludes": [
                "/path1/path2",
                "/path4"
            ]
        }
    );

    indexer.run().then(
        function (idx) {
            console.log(idx.length + " documents indexed");
            console.log("publishing to algolia...");

            algolia.saveObjects(idx, function (err, content) {
                if (err === null) {
                    console.log("published!");
                    algolia.deleteByQuery({
                        filters: "indexTime < " + idx[0].indexTime
                    }, function (err) {
                        if (!err) {
                            console.log("old records deleted");
                        }
                    });
                } else {
                    console.error(err);
                }
            });

        }
    );
});