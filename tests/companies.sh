#curl -X POST -d 'message=I am going to do $TSLA some yes text $MSFT analysis on the no to see $AAPL some word info' 'http://localhost:5000/api/v1/text/analysis'
curl -X GET 'http://localhost:5000/api/v1/text/analysis?message=I+am+going+to+do+%24TSLA+some+yes+text+%24MSFT+analysis+on+the+no+to+see+%24AAPL+some+word+info%27'
