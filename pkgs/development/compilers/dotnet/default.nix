/*
How to combine packages for use in development:
dotnetCombined = with dotnetCorePackages; combinePackages [ sdk_3_1 sdk_2_2 sdk_3_0 sdk aspnetcore_2_1 ];
*/
{ callPackage }:
let
  buildDotnet = attrs: callPackage (import ./build-dotnet.nix attrs) {};
  buildAspNetCore = attrs: buildDotnet (attrs // { type = "aspnetcore"; });
  buildNetCore = attrs: buildDotnet (attrs // { type = "netcore"; });
  buildNetCoreSdk = attrs: buildDotnet (attrs // { type = "sdk"; });
in
rec {
  combinePackages = attrs: callPackage (import ./combine-packages.nix attrs) {};

  # v2.1.22 (LTS)

  aspnetcore_2_1 = buildAspNetCore {
    version = "2.1.22";
    sha512 = {
      x86_64-linux = "27v3a69dgnnb4lz5p2dn2qwadb8vpnqwdy6mnnqfp1dl4kgg3izvriz2268if272sy6flcz5lckjlmn0i0i1jci5zypc7x9kykj991l";
      aarch64-linux = null; # no aarch64 version of this package is available
      x86_64-darwin = "0xh06jmzx2cfq51hv9l4h72hbfyh3r0wlla217821gi0hlw6xcc0gb3b4xmqcs240fllqnwrnrwz0axi3xi21wacgn3xbcmzpbi6jml";
    };
  };

  netcore_2_1 = buildNetCore {
    version = "2.1.22";
    sha512 = {
      x86_64-linux = "0c2b31l59izcxbhz5wzjpjkdl550s5p3aid4vyghq468vyf67pm0npjny50c172b63vw0ikfbps2b2hj16hpifp116gj4b5llmqjhyc";
      aarch64-linux = "3llai3d2xpgbr7a4ndg9wqfpnb5zb8k07dicc57a6cmniiqyqigyxinhpx2k0l45mbnihjsr5k1rih3r6bwlj241v67iwd2i0dpqd8a";
      x86_64-darwin = "106mx6a4rwcvq41v54c1yx89156s43n889im9g0q2pvm7054q8b6xm6qrnymzmj5i2i6awyk0z02j5pfiyh35sw9afxb3695ymsb3v8";
    };
  };

  sdk_2_1 = buildNetCoreSdk {
    version = "2.1.810";
    sha512 = {
      x86_64-linux = "388nrba5f7z9syq23xh3k45rzy3iys58s32ya7a0q9mwdf1y3haw7yvbq79cn08741hhqdi73mip8jf50f4s64mbr62ay1p76zsrkj5";
      aarch64-linux = "2vs8bhk63cjrqkm5n164ahc6bdz58aq9vmhaiyy27krp7wlkz4gpiva9153h7mywhk709l1qc7cddj99qsh2ygv6axjfigbhgrzslqi";
      x86_64-darwin = "3qxlgbd0np0w8wmp98mhp4cqgva4zglqf7k9kzqbwxfwr5s795kap7rs5w0cy7h0bsvj0ygx3d5nzyn9hp3fsswx4jl4mkvillnvjzy";
    };
  };

  # v2.2

  sdk_2_2 = throw "Dotnet SDK 2.2 is EOL, please use 3.1";

  # v3.0.2 (Maintenance)

  aspnetcore_3_0 = buildAspNetCore {
    version = "3.0.3";
    sha512 = {
      x86_64-linux = "342v6kxxbxky09d1c392vvr9rm30lf75wccka1bk2h4advlcga5nlgv93g7vrq48bsyxfi5gc36r3b0dlwl1g409g5mlk1042n6d0yq";
      aarch64-linux = "2xkg4q88q5jw6jdz6cxj8vsjr475nd0fcvifkv1shdm2j9dsjy233hwpxbr140m5n5ggyh6z99238z9j4kp2az977y8y8irz8m8ppvf";
      x86_64-darwin = "2p04j6p4j93pan71ih13hv57zxalcirh0n3vfjq0cfb80pbhf1f5cgxl24pw6kifh6hhh38rj62c4mr69lxzlqc8sfcfaws8dyz2avm";
    };
  };

  netcore_3_0 = buildNetCore {
    version = "3.0.3";
    sha512 = {
      x86_64-linux = "32ykpcw2xx708r2lxcwcbxnmy4sk159rlfjfvkw990qh7n79pm3lm2qwa3zhqcslznmpg18kwxz8qb5fgsa0h49g843xx4kyai0n7rx";
      aarch64-linux = "1lp8din7d5jv5fkyq1a7m01i1xg9jwpiljvam1kcyzsnwzvi0cb4ji336cfx4lqrn95gvc75gkzi6q8b4fz0h21gvk6z6kmlcr63nyg";
      x86_64-darwin = "0s20k7xawwd09xhy4xdcxp1rw6jd418ibrvhb509dnj480g48xryda2203g4mpswd24v2kx0n9qzxgbrbq9lvasfglkxi84bbqayp83";
    };
  };

  sdk_3_0 = buildNetCoreSdk {
    version = "3.0.103";
    sha512 = {
      x86_64-linux = "2diiplgxs92fkb6ym68b02d79z4qn63x5qlky5lvr757c1zkh0vfpk3khawdg94kdn4qkn6dmyqr0msxqgmiqyhp63cadzqq4vx7b12";
      aarch64-linux = "32843q2lj7dgciq62g9v1q31vwfjyv5vaxrz712d942mcg5lyzjygwri106bv4naq3a22131ldzwnsifbdn2vq1iz60raqdb7ss9vnf";
      x86_64-darwin = "3apswk2bhalgi0hm7h2j9p152jvp39h4xilxxzix5j1n36b442l1pwk7lj7019lxafjqkz5y850xkfcp14ks5wcvs33xs2c0aqwxvcn";
    };
  };

  # v3.1.1 (LTS)

  aspnetcore_3_1 = buildAspNetCore {
    version = "3.1.8";
    sha512 = {
      x86_64-linux = "0i3dqsmh5x2aaagw30zvr0ydmzms5j6xvmwq0yx79r1hncw0zg8w1zq7cxvaddszl13d24wxb8vm4varkiv3fy8z3n2ndmhlqa2qcyw";
      aarch64-linux = "3f3xky7jqpqwnsg730ka1576ppsspi25xlqsrqmwlbanad0r89lidfppr34nsys9gb5f1vx1zkv73dn4jhl6yawnas9j9f8nhi5mq40";
      x86_64-darwin = "1gbiizljh80m9sqv4ynvch7si55if43f4ccfd9ynakwm777fddbg8py338l7irnxc5rid3xzw7c0yj5p8f22n38krlxkvr1zcwij68b";
    };
  };

  netcore_3_1 = buildNetCore {
    version = "3.1.5";
    sha512 = {
      x86_64-linux = "03g6aghbpsxj9csaq9lkc8cad1nk8kvlivkarq6bfqvx992fxw6zryp7kcm5h6a5gkgpimb1nr17vndj1r629hdhpincqj8yw6i33mq";
      aarch64-linux = "25gwicmpzhzs96w3azypbl32bx967f14xkfdgvl7knw234rcmfv7zr0a7lb3vci68dbx4xywpnwlrvgi54mimzp8nagrgwva8zrrxzb";
      x86_64-darwin = "2g28jmv1n7pgxfq4wk9x58y5dp835c7rckz6c88ylk7g9w6z75l94pblfl1rc7mr6g3wddiy5cl87a607j9g283hv28a4vcpvll8s7g";
    };
  };

  sdk_3_1 = buildNetCoreSdk {
    version = "3.1.402";
    sha512 = {
      x86_64-linux = "2zdb5cl4swg7kvnla6kgnnwg3kkb3rj2ccizg43fw89h8nacr1klz3zdl5km9l553lvm364dy8xsdwm79bw1ch0qgff6snnbbxlw5a2";
      aarch64-linux = "1aq8fhsn15362x99dfp72m67zbswrg30xscy1n983mmq76qn5ha6sy8pyj84l7qcs0n1b7akb77qyi3d2ns8bd2wl6s1dacl24gn10p";
      x86_64-darwin = "1gk6sgd9gdc6nr64mdfj6lhzdi6ixi5c1r0i1b7bhkg2xycx5cnbgjycrpqh17h6wbp68dz4mkg5hf1y3527hdwypa9k0sqdg3yrdb8";
    };
  };
}
