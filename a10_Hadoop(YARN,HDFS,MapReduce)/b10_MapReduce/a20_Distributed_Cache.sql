

Distributed cache in Hadoop is a service by MapReduce
framework to cache files when needed.

Once a file is cached for a specific job, Hadoop will make
it available on each DataNode both in system and in memory,
where map and reduce tasks are executing. Later, you can
easily access and read the cache file and populate any
collection (like array, hashmap) in your code.

