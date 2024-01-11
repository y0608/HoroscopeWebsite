const { AsyncDatabase } = require("promised-sqlite3");

const dbPromise = (async () => {
  try {
    // Create the AsyncDatabase object and open the database.
    const db = await AsyncDatabase.open("./db.sqlite");

    // Access the inner sqlite3.Database object to use the API that is not exposed by AsyncDatabase.
    db.inner.on("trace", (sql) => console.log("[TRACE]", sql));

    // Run some sql request.
    await db.run(
    `
        CREATE TABLE IF NOT EXISTS posts (
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            title TEXT NOT NULL, 
            content TEXT NOT NULL
        )
    ` 
    );

    return db;
  } catch (err) {
    console.error(err);
  }
})();

const db = {
    
}