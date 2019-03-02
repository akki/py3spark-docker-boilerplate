from pyspark import SparkContext
from pyspark.sql import SparkSession

def main():
    spark = SparkSession(SparkContext())
    df = spark.createDataFrame([
        ("Samosa", "Easy"),
        ("Malai kofta", "Hard"),
        ("Idli",  "Medium")
    ], ["dish", 'difficulty'])
    df.show()


if __name__ == '__main__':
    main()

