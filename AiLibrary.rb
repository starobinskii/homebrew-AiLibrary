class Ailibrary < Formula
  desc "C++ Library from Ailurus Studio"
  homepage "https://github.com/starobinskii/AiLibrary"
  url "https://github.com/starobinskii/AiLibrary/archive/v1.3.0.tar.gz"
  sha256 "f8da497ab2a81667b86d480d451d767bdf38bacea1ff606e404e314b503fdf8f"
  
  head "https://github.com/starobinskii/AiLibrary.git", :branch => "master"

  def install
    include.install "ai.hh"
    ohai "to use the library, please set your include path accordingly:"
    ohai "CPPFLAGS: -I#{include}"
  end

  test do
    (testpath/"test.cc").write <<~EOS
      #include <ai.hh>
      int main(){
        ai::printLine(ai::string("This is AiLibrary v")
          + ai::getVersion() + ai::string(", welcome!")
        );
        return 0;
      }
    EOS
    system ENV.cxx, "test.cc", "-I#{include}", "-std=c++11", "-o", "test"
    system "./test"
  end
end
