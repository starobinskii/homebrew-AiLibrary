class Ailibrary < Formula
  desc "C++ Library from Ailurus Studio"
  homepage "https://github.com/starobinskii/AiLibrary"
  url "https://github.com/starobinskii/AiLibrary/archive/v1.2.0.tar.gz"
  sha256 "f5e96c4749571f3cc82159298899695a8fcb801c8761b2dad664fe6794536bc8"
  
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
          + ai::getVersion()+ ai::string(", welcome!")
        );
        return 0;
      }
    EOS
    system ENV.cxx, "test.cc", "-I#{include}", "-std=c++11", "-o", "test"
    system "./test"
  end
end
