abstract class INavigationService {
  Future<void> avigateToPage(String path, Object data);
  Future<void> navigateToPageClear(String path, Object data);
}
