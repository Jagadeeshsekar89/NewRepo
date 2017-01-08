using System.Security.Cryptography;
using System.Text;

namespace SmartERP.Web.Utilities
{
    public class SecurityHelper
    {
        public static string GetSHA256Hashing(string email, string password)
        {
            string toHash = email + password;
            SHA256Managed sha256 = new SHA256Managed();
            System.Text.StringBuilder hash = new System.Text.StringBuilder();
            byte[] crypto = sha256.ComputeHash(Encoding.UTF8.GetBytes(toHash), 0, Encoding.UTF8.GetByteCount(toHash));
            foreach (byte theByte in crypto)
            {
                hash.Append(theByte.ToString("x2"));
            }
            return hash.ToString();
        }
    }
}