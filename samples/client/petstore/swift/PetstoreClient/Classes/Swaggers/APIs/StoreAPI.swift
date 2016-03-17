//
// StoreAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Alamofire
import PromiseKit



public class StoreAPI: APIBase {
    /**
     
     Delete purchase order by ID
     
     - parameter orderId: (path) ID of the order that needs to be deleted 
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func deleteOrder(orderId orderId: String, completion: ((error: ErrorType?) -> Void)) {
        deleteOrderWithRequestBuilder(orderId: orderId).execute { (response, error) -> Void in
            completion(error: error);
        }
    }

    /**
     
     Delete purchase order by ID
     
     - parameter orderId: (path) ID of the order that needs to be deleted 
     - returns: Promise<Void>
     */
    public class func deleteOrder(orderId orderId: String) -> Promise<Void> {
        let deferred = Promise<Void>.pendingPromise()
        deleteOrder(orderId: orderId) { error in
            if let error = error {
                deferred.reject(error)
            } else {
                deferred.fulfill()
            }
        }
        return deferred.promise
    }

    /**
     
     Delete purchase order by ID
     
     - DELETE /store/order/{orderId}
     - For valid response try integer IDs with value < 1000. Anything above 1000 or nonintegers will generate API errors
     
     - parameter orderId: (path) ID of the order that needs to be deleted 

     - returns: RequestBuilder<Void> 
     */
    public class func deleteOrderWithRequestBuilder(orderId orderId: String) -> RequestBuilder<Void> {
        var path = "/store/order/{orderId}"
        path = path.stringByReplacingOccurrencesOfString("{orderId}", withString: "\(orderId)", options: .LiteralSearch, range: nil)
        let URLString = PetstoreClientAPI.basePath + path
        
        let nillableParameters: [String:AnyObject?] = [:]
        let parameters = APIHelper.rejectNil(nillableParameters)

        let requestBuilder: RequestBuilder<Void>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: parameters, isBody: true)
    }

    /**
     
     Finds orders by status
     
     - parameter status: (query) Status value that needs to be considered for query (optional, default to placed)
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func findOrdersByStatus(status status: String?, completion: ((data: [Order]?, error: ErrorType?) -> Void)) {
        findOrdersByStatusWithRequestBuilder(status: status).execute { (response, error) -> Void in
            completion(data: response?.body, error: error);
        }
    }

    /**
     
     Finds orders by status
     
     - parameter status: (query) Status value that needs to be considered for query (optional, default to placed)
     - returns: Promise<[Order]>
     */
    public class func findOrdersByStatus(status status: String?) -> Promise<[Order]> {
        let deferred = Promise<[Order]>.pendingPromise()
        findOrdersByStatus(status: status) { data, error in
            if let error = error {
                deferred.reject(error)
            } else {
                deferred.fulfill(data!)
            }
        }
        return deferred.promise
    }

    /**
     
     Finds orders by status
     
     - GET /store/findByStatus
     - A single status value can be provided as a string
     - API Key:
       - type: apiKey x-test_api_client_id 
       - name: test_api_client_id
     - API Key:
       - type: apiKey x-test_api_client_secret 
       - name: test_api_client_secret
     - examples: [{example=[ {
  "id" : 123456789,
  "petId" : 123456789,
  "complete" : true,
  "status" : "aeiou",
  "quantity" : 123,
  "shipDate" : "2000-01-23T04:56:07.000+0000"
} ], contentType=application/json}, {example=<Order>
  <id>123456</id>
  <petId>123456</petId>
  <quantity>0</quantity>
  <shipDate>2000-01-23T04:56:07.000Z</shipDate>
  <status>string</status>
  <complete>true</complete>
</Order>, contentType=application/xml}]
     - examples: [{example=[ {
  "id" : 123456789,
  "petId" : 123456789,
  "complete" : true,
  "status" : "aeiou",
  "quantity" : 123,
  "shipDate" : "2000-01-23T04:56:07.000+0000"
} ], contentType=application/json}, {example=<Order>
  <id>123456</id>
  <petId>123456</petId>
  <quantity>0</quantity>
  <shipDate>2000-01-23T04:56:07.000Z</shipDate>
  <status>string</status>
  <complete>true</complete>
</Order>, contentType=application/xml}]
     
     - parameter status: (query) Status value that needs to be considered for query (optional, default to placed)

     - returns: RequestBuilder<[Order]> 
     */
    public class func findOrdersByStatusWithRequestBuilder(status status: String?) -> RequestBuilder<[Order]> {
        let path = "/store/findByStatus"
        let URLString = PetstoreClientAPI.basePath + path
        
        let nillableParameters: [String:AnyObject?] = [
            "status": status
        ]
        let parameters = APIHelper.rejectNil(nillableParameters)

        let requestBuilder: RequestBuilder<[Order]>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: URLString, parameters: parameters, isBody: false)
    }

    /**
     
     Returns pet inventories by status
     
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func getInventory(completion: ((data: [String:Int]?, error: ErrorType?) -> Void)) {
        getInventoryWithRequestBuilder().execute { (response, error) -> Void in
            completion(data: response?.body, error: error);
        }
    }

    /**
     
     Returns pet inventories by status
     
     - returns: Promise<[String:Int]>
     */
    public class func getInventory() -> Promise<[String:Int]> {
        let deferred = Promise<[String:Int]>.pendingPromise()
        getInventory() { data, error in
            if let error = error {
                deferred.reject(error)
            } else {
                deferred.fulfill(data!)
            }
        }
        return deferred.promise
    }

    /**
     
     Returns pet inventories by status
     
     - GET /store/inventory
     - Returns a map of status codes to quantities
     - API Key:
       - type: apiKey api_key 
       - name: api_key
     - examples: [{example={
  "key" : 123
}, contentType=application/json}, {example=not implemented io.swagger.models.properties.MapProperty@d1e580af, contentType=application/xml}]
     - examples: [{example={
  "key" : 123
}, contentType=application/json}, {example=not implemented io.swagger.models.properties.MapProperty@d1e580af, contentType=application/xml}]

     - returns: RequestBuilder<[String:Int]> 
     */
    public class func getInventoryWithRequestBuilder() -> RequestBuilder<[String:Int]> {
        let path = "/store/inventory"
        let URLString = PetstoreClientAPI.basePath + path
        
        let nillableParameters: [String:AnyObject?] = [:]
        let parameters = APIHelper.rejectNil(nillableParameters)

        let requestBuilder: RequestBuilder<[String:Int]>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: URLString, parameters: parameters, isBody: true)
    }

    /**
     
     Fake endpoint to test arbitrary object return by 'Get inventory'
     
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func getInventoryInObject(completion: ((data: AnyObject?, error: ErrorType?) -> Void)) {
        getInventoryInObjectWithRequestBuilder().execute { (response, error) -> Void in
            completion(data: response?.body, error: error);
        }
    }

    /**
     
     Fake endpoint to test arbitrary object return by 'Get inventory'
     
     - returns: Promise<AnyObject>
     */
    public class func getInventoryInObject() -> Promise<AnyObject> {
        let deferred = Promise<AnyObject>.pendingPromise()
        getInventoryInObject() { data, error in
            if let error = error {
                deferred.reject(error)
            } else {
                deferred.fulfill(data!)
            }
        }
        return deferred.promise
    }

    /**
     
     Fake endpoint to test arbitrary object return by 'Get inventory'
     
     - GET /store/inventory?response=arbitrary_object
     - Returns an arbitrary object which is actually a map of status codes to quantities
     - API Key:
       - type: apiKey api_key 
       - name: api_key
     - examples: [{example="{}", contentType=application/json}, {example=not implemented io.swagger.models.properties.ObjectProperty@37aadb4f, contentType=application/xml}]
     - examples: [{example="{}", contentType=application/json}, {example=not implemented io.swagger.models.properties.ObjectProperty@37aadb4f, contentType=application/xml}]

     - returns: RequestBuilder<AnyObject> 
     */
    public class func getInventoryInObjectWithRequestBuilder() -> RequestBuilder<AnyObject> {
        let path = "/store/inventory?response=arbitrary_object"
        let URLString = PetstoreClientAPI.basePath + path
        
        let nillableParameters: [String:AnyObject?] = [:]
        let parameters = APIHelper.rejectNil(nillableParameters)

        let requestBuilder: RequestBuilder<AnyObject>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: URLString, parameters: parameters, isBody: true)
    }

    /**
     
     Find purchase order by ID
     
     - parameter orderId: (path) ID of pet that needs to be fetched 
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func getOrderById(orderId orderId: String, completion: ((data: Order?, error: ErrorType?) -> Void)) {
        getOrderByIdWithRequestBuilder(orderId: orderId).execute { (response, error) -> Void in
            completion(data: response?.body, error: error);
        }
    }

    /**
     
     Find purchase order by ID
     
     - parameter orderId: (path) ID of pet that needs to be fetched 
     - returns: Promise<Order>
     */
    public class func getOrderById(orderId orderId: String) -> Promise<Order> {
        let deferred = Promise<Order>.pendingPromise()
        getOrderById(orderId: orderId) { data, error in
            if let error = error {
                deferred.reject(error)
            } else {
                deferred.fulfill(data!)
            }
        }
        return deferred.promise
    }

    /**
     
     Find purchase order by ID
     
     - GET /store/order/{orderId}
     - For valid response try integer IDs with value <= 5 or > 10. Other values will generated exceptions
     - API Key:
       - type: apiKey test_api_key_header 
       - name: test_api_key_header
     - API Key:
       - type: apiKey test_api_key_query (QUERY)
       - name: test_api_key_query
     - examples: [{example={
  "id" : 123456789,
  "petId" : 123456789,
  "complete" : true,
  "status" : "aeiou",
  "quantity" : 123,
  "shipDate" : "2000-01-23T04:56:07.000+0000"
}, contentType=application/json}, {example=<Order>
  <id>123456</id>
  <petId>123456</petId>
  <quantity>0</quantity>
  <shipDate>2000-01-23T04:56:07.000Z</shipDate>
  <status>string</status>
  <complete>true</complete>
</Order>, contentType=application/xml}]
     - examples: [{example={
  "id" : 123456789,
  "petId" : 123456789,
  "complete" : true,
  "status" : "aeiou",
  "quantity" : 123,
  "shipDate" : "2000-01-23T04:56:07.000+0000"
}, contentType=application/json}, {example=<Order>
  <id>123456</id>
  <petId>123456</petId>
  <quantity>0</quantity>
  <shipDate>2000-01-23T04:56:07.000Z</shipDate>
  <status>string</status>
  <complete>true</complete>
</Order>, contentType=application/xml}]
     
     - parameter orderId: (path) ID of pet that needs to be fetched 

     - returns: RequestBuilder<Order> 
     */
    public class func getOrderByIdWithRequestBuilder(orderId orderId: String) -> RequestBuilder<Order> {
        var path = "/store/order/{orderId}"
        path = path.stringByReplacingOccurrencesOfString("{orderId}", withString: "\(orderId)", options: .LiteralSearch, range: nil)
        let URLString = PetstoreClientAPI.basePath + path
        
        let nillableParameters: [String:AnyObject?] = [:]
        let parameters = APIHelper.rejectNil(nillableParameters)

        let requestBuilder: RequestBuilder<Order>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: URLString, parameters: parameters, isBody: true)
    }

    /**
     
     Place an order for a pet
     
     - parameter body: (body) order placed for purchasing the pet (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func placeOrder(body body: Order?, completion: ((data: Order?, error: ErrorType?) -> Void)) {
        placeOrderWithRequestBuilder(body: body).execute { (response, error) -> Void in
            completion(data: response?.body, error: error);
        }
    }

    /**
     
     Place an order for a pet
     
     - parameter body: (body) order placed for purchasing the pet (optional)
     - returns: Promise<Order>
     */
    public class func placeOrder(body body: Order?) -> Promise<Order> {
        let deferred = Promise<Order>.pendingPromise()
        placeOrder(body: body) { data, error in
            if let error = error {
                deferred.reject(error)
            } else {
                deferred.fulfill(data!)
            }
        }
        return deferred.promise
    }

    /**
     
     Place an order for a pet
     
     - POST /store/order
     - 
     - API Key:
       - type: apiKey x-test_api_client_id 
       - name: test_api_client_id
     - API Key:
       - type: apiKey x-test_api_client_secret 
       - name: test_api_client_secret
     - examples: [{example={
  "id" : 123456789,
  "petId" : 123456789,
  "complete" : true,
  "status" : "aeiou",
  "quantity" : 123,
  "shipDate" : "2000-01-23T04:56:07.000+0000"
}, contentType=application/json}, {example=<Order>
  <id>123456</id>
  <petId>123456</petId>
  <quantity>0</quantity>
  <shipDate>2000-01-23T04:56:07.000Z</shipDate>
  <status>string</status>
  <complete>true</complete>
</Order>, contentType=application/xml}]
     - examples: [{example={
  "id" : 123456789,
  "petId" : 123456789,
  "complete" : true,
  "status" : "aeiou",
  "quantity" : 123,
  "shipDate" : "2000-01-23T04:56:07.000+0000"
}, contentType=application/json}, {example=<Order>
  <id>123456</id>
  <petId>123456</petId>
  <quantity>0</quantity>
  <shipDate>2000-01-23T04:56:07.000Z</shipDate>
  <status>string</status>
  <complete>true</complete>
</Order>, contentType=application/xml}]
     
     - parameter body: (body) order placed for purchasing the pet (optional)

     - returns: RequestBuilder<Order> 
     */
    public class func placeOrderWithRequestBuilder(body body: Order?) -> RequestBuilder<Order> {
        let path = "/store/order"
        let URLString = PetstoreClientAPI.basePath + path
        
        let parameters = body?.encodeToJSON() as? [String:AnyObject]

        let requestBuilder: RequestBuilder<Order>.Type = PetstoreClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: URLString, parameters: parameters, isBody: true)
    }

}
