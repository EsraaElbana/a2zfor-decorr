
abstract class ClientStates{}

class InitialState extends ClientStates{}



class GetAllProductError extends ClientStates{}
class GetAllProductLoading extends ClientStates{}
class GetAllProductSuccess extends ClientStates{}



class GetSpecialProductError extends ClientStates{}
class GetSpecialProductLoading extends ClientStates{}
class GetSpecialProductSuccess extends ClientStates{}


class SearchedProductError extends ClientStates{}
class SearchedProductLoading extends ClientStates{}
class SearchedProductSuccess extends ClientStates{}


class GetCategoryError extends ClientStates{}
class GetCategoryLoading extends ClientStates{}
class GetCategorySuccess extends ClientStates{}



class GetDesignerError extends ClientStates{}
class GetDesignerLoading extends ClientStates{}
class GetDesignerSuccess extends ClientStates{}


class AddToCartLoading extends ClientStates{}
class AddToCartError extends ClientStates{}
class AddToCartSuccess extends ClientStates{}



class GetAllCartLoading extends ClientStates{}
class GetAllCartError extends ClientStates{}
class GetAllCartSuccess extends ClientStates{}


class DeleteItemCartError extends ClientStates{}
class DeleteItemCartSuccess extends ClientStates{}
class DeleteItemCartLoading extends ClientStates{}

class ContactUsLoading extends ClientStates{}
class ContactUsError extends ClientStates{}
class ContactUsSuccess extends ClientStates{}






class ServerErrorClient extends ClientStates{}