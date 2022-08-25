using CryptoTracker.DataAccess.DbAccess;

namespace CryptoTracker.DataAccess.Data;
public class DataBase
{
    internal readonly ISqlDataAccess _db;

    public DataBase(ISqlDataAccess db)
    {
        _db = db;
    }
}
