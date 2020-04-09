Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B59C01A3699
	for <lists+openbmc@lfdr.de>; Thu,  9 Apr 2020 17:07:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ykz85sDxzDqTv
	for <lists+openbmc@lfdr.de>; Fri, 10 Apr 2020 01:07:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ykyB63hYzDqQK
 for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2020 01:06:51 +1000 (AEST)
IronPort-SDR: AZlGtfr/ze8koqIHOk96CzOizzy2pxknjpEgvMv+7HDFE1gD75xenbSmdJGItTMiZ7c9RQa47k
 SKPGFNvRW2zQ==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 08:06:46 -0700
IronPort-SDR: 8plB3A0raijCmjcy5UrVwNlQpRwKdM9NE4Sk+Fh8ZvSQ44eNenW3E1RpfHOuV7LBzTiUCLJunL
 1/zKiiatZwwQ==
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; 
 d="asc'?scan'208,217";a="251918516"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.75])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 08:06:45 -0700
Subject: Re: OpenBMC : KVM over IP and media redirection function
To: "Tiger Liu(BJ-RD)" <TigerLiu@zhaoxin.com>,
 "chunhui.jia" <chunhui.jia@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <e03bdf55444c437ca6133440aa85a3ff@zhaoxin.com>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Autocrypt: addr=johnathanx.mantey@intel.com; prefer-encrypt=mutual; keydata=
 mQENBFija08BCAC60TO2X22b0tJ2Gy2iQLWx20mGcD7ugBpm1o2IW2M+um3GR0BG/bUcLciw
 dEnX9SWT30jx8TimenyUYeDS1CKML/e4JnCAUhSktNZRPBjzla991OkpqtFJEHj/pHrXTsz0
 ODhmnSaZ49TsY+5BqtRMexICYOtSP8+xuftPN7g2pQNFi7xYlQkutP8WKIY3TacW/6MPiYek
 pqVaaF0cXynCMDvbK0km7m0S4X01RZFKXUwlbuMireNk4IyZ/59hN+fh1MYMQ6RXOgmHqxSu
 04GjkbBLf2Sddplb6KzPMRWPJ5uNdvlkAfyT4P0R5EfkV5wCRdoJ1lNC9WI1bqHkbt07ABEB
 AAG0JUpvaG5hdGhhbiBNYW50ZXkgPG1hbnRleWpnQGdtYWlsLmNvbT6JATcEEwEIACEFAlij
 a08CGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQ0EfviT3fHwmcBAgAkENzQ8s0RK+f
 nr4UogrCBS132lDdtlOypm1WgGDOVQNra7A1rvXFgN05RqrdRTpRevv7+S8ipbiG/kxn9P8+
 VhhW1SvUT8Tvkb9YYHos6za3v0YblibFNbYRgQcybYMeKz2/DcVU+ioKZ1SxNJsFXx6wH71I
 V2YumQRHAsh4Je6CmsiMVP4XNadzCQXzzcU9sstKV0A194JM/d8hjXfwMHZE6qnKgAkHIV3Q
 61YCuvkdr5SJSrOVo2IMN0pVxhhW7lqCAGBGb4oOhqePwGqOabU3Ui4qTbHP2BWP5UscehkK
 6TVKcpYApsUcWyxvvOARoktmlPnGYqJPnRwXpQBlqLkBDQRYo2tPAQgAyOv5Lgg2VkHO84R7
 LJJDBxcaCDjyAvHBynznEEk11JHrPuonEWi6pqgB8+Kc588/GerXZqJ9AMkR43UW/5cPlyF2
 wVO4aYaQwryDtiXEu+5rpbQfAvBpKTbrBfYIPc8thuAC2kdB4IO24T6PVSYVXYc/giOL0Iwb
 /WZfMd5ajtKfa727xfbKCEHlzakqmUl0SyrARdrSynhX1R9Wnf2BwtUV7mxFxtMukak0zdTf
 2IXZXDltZC224vWqkXiI7Gt/FDc2y6gcsYY/4a2+vjhWuZk3lEzP0pbXQqOseDM1zZXln/m7
 BFbJ6VUn1zWcrt0c82GTMqkeGUheUhDiYLQ7xwARAQABiQEfBBgBCAAJBQJYo2tPAhsMAAoJ
 ENBH74k93x8JKEUH/3UPZryjmM0F3h8I0ZWuruxAxiqvksLOOtarU6RikIAHhwjvluEcTH4E
 JsDjqtRUvBMU907XNotpqpW2e9jN8tFRyR4wW9CYkilB02qgrDm9DXVGb2BDtC/MY+6KUgsG
 k5Ftr9uaXNd0K4IGRJSyU6ZZn0inTcXlqD+NgOE2eX9qpeKEhDufgF7fKHbKDkS4hj6Z09dT
 Y8eW9d6d2Yf/RzTBJvZxjBFbIgeUGeykbSKztp2OBe6mecpVPhKooTq+X/mJehpRA6mAhuQZ
 28lvie7hbRFjqR3JB7inAKL4eT1/9bT/MqcPh43PXTAzB6/Iclg5B7GGgEFe27VL0hyqiqc=
Message-ID: <f208b51c-2ab1-487f-86ba-21a9a6e95b2f@intel.com>
Date: Thu, 9 Apr 2020 08:06:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <e03bdf55444c437ca6133440aa85a3ff@zhaoxin.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="o7RlyxGygYUafcG9SuJthZum5mjkTTSMD"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--o7RlyxGygYUafcG9SuJthZum5mjkTTSMD
Content-Type: multipart/mixed; boundary="956xsmcQy1tBdP3SRUMCgvAV05t1IKd4Z"

--956xsmcQy1tBdP3SRUMCgvAV05t1IKd4Z
Content-Type: multipart/alternative;
 boundary="------------5059704AFDD4777C65630ED5"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------5059704AFDD4777C65630ED5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

TGl1LAoKUk1NIGlzIGEgSFcgbGljZW5zaW5nIGRldmljZSwgYW5kIHdhcywgaWYgSSByZWNh
bGwsIGVsaW1pbmF0ZWQgaW4gdGhlCmxhc3QgZ2VuZXJhdGlvbiBvZiBJbnRlbCBzZXJ2ZXJz
IChpLmUuIFMyNjAwV0YsIFMyNjAwQk5QLCBTMjYwMFNXUCkuCk9wZW5CTUMgcHJvdmlkZXMg
eW91IGFsbCBvZiB0aGUgc291cmNlLCBzbyBhbnkgY29udHJvbCBvdmVyIFNXIGZlYXR1cmVz
Cmxpa2UgS1ZNIChhc3N1bWluZyB0aGUgS1ZNIHNvdXJjZSBpcyBvcGVuKSwgYnkgSFcgY29t
cG9uZW50cyBiZWluZwpwcmVzZW50IGNhbiBiZSBjb21waWxlZCBvdXQgb2YgeW91ciBpbXBs
ZW1lbnRhdGlvbi4KSSBoYXZlIGEgaGFyZCB0aW1lIGJlbGlldmluZyB0aGUgT1BDIHdvdWxk
IHdpbGxpbmdseSBhZGQgYSBIVyBkZXZpY2UgZm9yCmVuYWJsaW5nL2Rpc2FibGluZyBTVyBm
dW5jdGlvbmFsaXR5LiBTZWVtcyBhIGJpdCBjb3VudGVyIHRvIHRoZSBzcGlyaXQKb2YgdGhl
IHByb2plY3RzIHBoaWxvc29waHkgdG8gbWUuCgpPbiA0LzkvMjAgMjoyNCBBTSwgVGlnZXIg
TGl1KEJKLVJEKSB3cm90ZToKPgo+IEhpLCBDaHVuaHVpOgo+Cj4gVGhhbmtzIGZvciB5b3Vy
IHJlcGx5Lgo+Cj4gwqAKPgo+IEkgYW0gc3R1ZHlpbmcgT0NQKE9wZW4gQ29tcHV0ZXIgUGxh
dGZvcm0pIHNlcnZlciBib2FyZCBkb2MgYW5kIE9wZW5CTUMKPiBkb2MuCj4KPiBJIGFtIGp1
c3QgY3VyaW91cyB3aGV0aGVyIE9DUCBzZXJ2ZXIgYm9hcmQgYWxzbyBuZWVkcyBhbiBhZGQt
b24gUk1NCj4gY29tcG9uZW50IHRvIHN1cHBvcnQgS1ZNL01lZGlhIHJlZGlyZWN0aW9uLgo+
Cj4gwqAKPgo+IFNvLCBPcGVuQk1D4oCZcyBjdXJyZW50IGNvZGUgaGFzIGltcGxlbWVudGVk
IEtWTSBvdmVyIElQLgo+Cj4gU28sIE9wZW5CTUMgd291bGQgc3VwcG9ydCBLVk0vTWVkaWEg
cmVkaXJlY3Rpb24gZnVuY3Rpb24gd2l0aG91dAo+IGFkZGluZyBhZGQtb24gc29tZSBSTU0g
bGlrZSBjb21wb25lbnQ/Cj4KPiDCoAo+Cj4gVGhhbmtzCj4KPiAq5Y+R5Lu25Lq6OipjaHVu
aHVpLmppYSA8Y2h1bmh1aS5qaWFAbGludXguaW50ZWwuY29tPgo+ICrlj5HpgIHml7bpl7Q6
KjIwMjDlubQ05pyIOeaXpTE2OjUxCj4gKuaUtuS7tuS6ujoqVGlnZXIgTGl1KEJKLVJEKSA8
VGlnZXJMaXVAemhhb3hpbi5jb20+OyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcKPiAq5Li7
6aKYOipSZTogT3BlbkJNQyA6IEtWTSBvdmVyIElQIGFuZCBtZWRpYSByZWRpcmVjdGlvbiBm
dW5jdGlvbgo+Cj4gwqAKPgo+IDEuIHllcywgaXQgY2FuIGltcGxlbWVudCB0aGUgZnVuY3Rp
b25hbGl0eSB3aXRoIHRoaXMgY29tYmluYXRpb24KPgo+IDIuIFdoYXQgcGxhdGZvcm0gYXJl
IHlvdSB1c2luZz8KPgo+IMKgCj4KPiAyMDIwLTA0LTA5Cj4KPiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPgo+IGNodW5odWkuamlhCj4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPgo+ICAgICAq5Y+R
5Lu25Lq677yaKiJUaWdlciBMaXUoQkotUkQpIiA8VGlnZXJMaXVAemhhb3hpbi5jb20KPiAg
ICAgPG1haWx0bzpUaWdlckxpdUB6aGFveGluLmNvbT4+Cj4KPiAgICAgKuWPkemAgeaXtumX
tO+8mioyMDIwLTA0LTA5wqAxNTo1Ngo+Cj4gICAgICrkuLvpopjvvJoqT3BlbkJNQyA6IEtW
TSBvdmVyIElQIGFuZCBtZWRpYSByZWRpcmVjdGlvbiBmdW5jdGlvbgo+Cj4gICAgICrmlLbk
u7bkurrvvJoqIm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZwo+ICAgICA8bWFpbHRvOm9wZW5i
bWNAbGlzdHMub3psYWJzLm9yZz4iPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZwo+ICAgICA8
bWFpbHRvOm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4+Cj4KPiAgICAgKuaKhOmAge+8mioK
Pgo+ICAgICDCoAo+Cj4gICAgIEhpLCBleHBlcnRzOgo+Cj4gICAgIEkgaGF2ZSBhIHF1ZXN0
aW9uIGFib3V0IEtWTSBvdmVyIElQIGFuZCBtZWRpYSByZWRpcmVjdGlvbiBmdW5jdGlvbi4K
Pgo+ICAgICBJbnRlbCBwcm92aWRlZCBhIFJNTSBsaXRlIGNvbXBvbmVudCwgd2hpY2ggcHJv
dmlkZWQgS1ZNL01lZGlhCj4gICAgIHJlZGlyZWN0aW9uIGNhcGFiaWxpdHkuCj4KPiAgICAg
wqAKPgo+ICAgICBTbyBteSBxdWVzdGlvbiBpczoKPgo+ICAgICAxLsKgwqDCoMKgwqAgT3Bl
bkJNQyArIEFTVDI1MDAgQ2hpcCwgY291bGQgbm90IGltcGxlbWVudCBLVk0vTWVkaWEKPiAg
ICAgcmVkaXJlY3Rpb24gY2FwYWJpbGl0eT8KPgo+ICAgICAyLsKgwqDCoMKgwqAgSWYgd2Fu
dGluZyB0byB1c2UgS1ZNL01lZGlhIHJlZGlyZWN0aW9uICxtdXN0IGJ1eSBhIFJNTQo+ICAg
ICBjb21wb25lbnQ/Cj4KPiAgICAgwqAKPgo+ICAgICBJIGZvdW5kIE9wZW5CTUMgaGFkIGlt
cGxlbWVudGVkIEtWTSBvdmVyIElQIGNhcGFiaWxpdHkuCj4KPiAgICAgwqAKPgo+ICAgICBU
aGFua3MKPgo+ICAgICDCoAo+Cj4gICAgIOS/neWvhuWjsOaYju+8mgo+Cj4gICAgIOacrOmC
ruS7tuWQq+acieS/neWvhuaIluS4k+acieS/oeaBr++8jOS7heS+m+aMh+WumuaUtuS7tuS6
uuS9v+eUqOOAguS4peemgeWvueacrOmCruS7tuaIluWFtuWGheWuueWBmuS7u+S9leacque7
j+aOiOadg+eahOafpemYheOAgeS9v+eUqOOAgeWkjeWItuaIlui9rOWPkeOAggo+Cj4gICAg
IC9DT05GSURFTlRJQUwgTk9URTogLwo+Cj4gICAgIC9UaGlzIGVtYWlsIGNvbnRhaW5zIGNv
bmZpZGVudGlhbCBvciBsZWdhbGx5IHByaXZpbGVnZWQKPiAgICAgaW5mb3JtYXRpb24gYW5k
IGlzIGZvciB0aGUgc29sZSB1c2Ugb2YgaXRzIGludGVuZGVkIHJlY2lwaWVudC4gQW55Cj4g
ICAgIHVuYXV0aG9yaXplZCByZXZpZXcsIHVzZSwgY29weWluZyBvciBmb3J3YXJkaW5nIG9m
IHRoaXMgZW1haWwgb3IKPiAgICAgdGhlIGNvbnRlbnQgb2YgdGhpcyBlbWFpbCBpcyBzdHJp
Y3RseSBwcm9oaWJpdGVkLi8KPgo+Cj4KPiDkv53lr4blo7DmmI7vvJoKPiDmnKzpgq7ku7bl
kKvmnInkv53lr4bmiJbkuJPmnInkv6Hmga/vvIzku4XkvpvmjIflrprmlLbku7bkurrkvb/n
lKjjgILkuKXnpoHlr7nmnKzpgq7ku7bmiJblhbblhoXlrrnlgZrku7vkvZXmnKrnu4/mjojm
nYPnmoTmn6XpmIXjgIHkvb/nlKjjgIHlpI3liLbmiJbovazlj5HjgIIKPiAvQ09ORklERU5U
SUFMIE5PVEU6IC8KPiAvVGhpcyBlbWFpbCBjb250YWlucyBjb25maWRlbnRpYWwgb3IgbGVn
YWxseSBwcml2aWxlZ2VkIGluZm9ybWF0aW9uCj4gYW5kIGlzIGZvciB0aGUgc29sZSB1c2Ug
b2YgaXRzIGludGVuZGVkIHJlY2lwaWVudC4gQW55IHVuYXV0aG9yaXplZAo+IHJldmlldywg
dXNlLCBjb3B5aW5nIG9yIGZvcndhcmRpbmcgb2YgdGhpcyBlbWFpbCBvciB0aGUgY29udGVu
dCBvZgo+IHRoaXMgZW1haWwgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4vCgotLSAKSm9obmF0
aGFuIE1hbnRleQpTZW5pb3IgU29mdHdhcmUgRW5naW5lZXIKKmF6YWQgdGUqKmNobm9sb2d5
IHBhcnRuZXJzKgpDb250cmlidXRpbmcgdG8gVGVjaG5vbG9neSBJbm5vdmF0aW9uIHNpbmNl
IDE5OTIKUGhvbmU6ICg1MDMpIDcxMi02NzY0CkVtYWlsOiBqb2huYXRoYW54Lm1hbnRleUBp
bnRlbC5jb20gPG1haWx0bzpqb2huYXRoYW54Lm1hbnRleUBpbnRlbC5jb20+Cgo=
--------------5059704AFDD4777C65630ED5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    Liu,<br>
    <br>
    RMM is a HW licensing device, and was, if I recall, eliminated in
    the last generation of Intel servers (i.e. S2600WF, S2600BNP,
    S2600SWP).<br>
    OpenBMC provides you all of the source, so any control over SW
    features like KVM (assuming the KVM source is open), by HW
    components being present can be compiled out of your implementation.<=
br>
    I have a hard time believing the OPC would willingly add a HW device
    for enabling/disabling SW functionality. Seems a bit counter to the
    spirit of the projects philosophy to me.<br>
    <br>
    <div class=3D"moz-cite-prefix">On 4/9/20 2:24 AM, Tiger Liu(BJ-RD)
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:e03bdf55444c437ca6133440aa85a3ff@zhaoxin.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DU=
TF-8">
      <meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered
        medium)">
      <base target=3D"_blank"><!--[if !mso]><style>v\:* {behavior:url(#de=
fault#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
=2Eshape {behavior:url(#default#VML);}
</style><![endif]-->
      <style><!--
/* Font Definitions */
@font-face
	{font-family:=E5=AE=8B=E4=BD=93;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:=E7=AD=89=E7=BA=BF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=E5=AE=8B=E4=BD=93";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=E7=AD=89=E7=BA=BF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Verdana;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:=C3=8E=C2=A2=C3=88=C3=AD=C3=91=C3=85=C2=BA=C3=9A;
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"\@=C3=8E=C2=A2=C3=88=C3=AD=C3=91=C3=85=C2=BA=C3=9A";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:=E7=AD=89=E7=BA=BF;
	mso-believe-normal-left:yes;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:=E5=AE=8B=E4=BD=93;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	text-indent:21.0pt;
	font-size:10.5pt;
	font-family:=E7=AD=89=E7=BA=BF;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:=E5=AE=8B=E4=BD=93;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:=E7=AD=89=E7=BA=BF;
	color:windowtext;}
span.EmailStyle22
	{mso-style-type:personal-reply;
	font-family:=E7=AD=89=E7=BA=BF;
	color:#1F497D;}
=2EMsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if mso 9]-->
      <style>p.MsoNormal
	{margin-left:9.0pt;}
</style><!--[endif]--><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
      <div class=3D"WordSection1">
        <p class=3D"MsoNormal"><span style=3D"color:#1F497D" lang=3D"EN-U=
S">Hi,
            Chunhui:<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"color:#1F497D" lang=3D"EN-U=
S">Thanks
            for your reply.<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"color:#1F497D" lang=3D"EN-U=
S"><o:p>=C2=A0</o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"color:#1F497D" lang=3D"EN-U=
S">I
            am studying OCP(Open Computer Platform) server board doc and
            OpenBMC doc.<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"color:#1F497D" lang=3D"EN-U=
S">I
            am just curious whether OCP server board also needs an
            add-on RMM component to support KVM/Media redirection.<o:p></=
o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"color:#1F497D" lang=3D"EN-U=
S"><o:p>=C2=A0</o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"color:#1F497D" lang=3D"EN-U=
S">So,
            OpenBMC=E2=80=99s current code has implemented KVM over IP.<o=
:p></o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"color:#1F497D" lang=3D"EN-U=
S">So,
            OpenBMC would support KVM/Media redirection function without
            adding add-on some RMM like component?<o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"color:#1F497D" lang=3D"EN-U=
S"><o:p>=C2=A0</o:p></span></p>
        <p class=3D"MsoNormal"><span style=3D"color:#1F497D" lang=3D"EN-U=
S">Thanks<o:p></o:p></span></p>
        <div>
          <div style=3D"border:none;border-top:solid #E1E1E1
            1.0pt;padding:3.0pt 0cm 0cm 0cm">
            <p class=3D"MsoNormal" style=3D"text-align:left" align=3D"lef=
t"><b><span
                  style=3D"font-size:11.0pt">=E5=8F=91=E4=BB=B6=E4=BA=BA<=
span lang=3D"EN-US">:</span></span></b><span
                style=3D"font-size:11.0pt" lang=3D"EN-US"> chunhui.jia
                <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:chunhui=
=2Ejia@linux.intel.com">&lt;chunhui.jia@linux.intel.com&gt;</a>
                <br>
              </span><b><span style=3D"font-size:11.0pt">=E5=8F=91=E9=80=81=
=E6=97=B6=E9=97=B4<span
                    lang=3D"EN-US">:</span></span></b><span
                style=3D"font-size:11.0pt" lang=3D"EN-US"> 2020</span><sp=
an
                style=3D"font-size:11.0pt">=E5=B9=B4<span lang=3D"EN-US">=
4</span>=E6=9C=88<span
                  lang=3D"EN-US">9</span>=E6=97=A5<span lang=3D"EN-US"> 1=
6:51<br>
                </span><b>=E6=94=B6=E4=BB=B6=E4=BA=BA<span lang=3D"EN-US"=
>:</span></b><span
                  lang=3D"EN-US"> Tiger Liu(BJ-RD)
                  <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Tiger=
Liu@zhaoxin.com">&lt;TigerLiu@zhaoxin.com&gt;</a>; <a class=3D"moz-txt-li=
nk-abbreviated" href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.oz=
labs.org</a><br>
                </span><b>=E4=B8=BB=E9=A2=98<span lang=3D"EN-US">:</span>=
</b><span
                  lang=3D"EN-US"> Re: OpenBMC : KVM over IP and media
                  redirection function<o:p></o:p></span></span></p>
          </div>
        </div>
        <p class=3D"MsoNormal" style=3D"text-align:left" align=3D"left"><=
span
            lang=3D"EN-US"><o:p>=C2=A0</o:p></span></p>
        <div>
          <p class=3D"MsoNormal" style=3D"text-align:left" align=3D"left"=
><span
              style=3D"font-family:&quot;=C3=8E=C2=A2=C3=88=C3=AD=C3=91=C3=
=85=C2=BA=C3=9A&quot;,serif;color:black"
              lang=3D"EN-US">1. yes, it can implement the functionality
              with this combination<o:p></o:p></span></p>
        </div>
        <div>
          <p class=3D"MsoNormal" style=3D"text-align:left" align=3D"left"=
><span
              style=3D"font-family:&quot;=C3=8E=C2=A2=C3=88=C3=AD=C3=91=C3=
=85=C2=BA=C3=9A&quot;,serif;color:black"
              lang=3D"EN-US">2. What platform are you using?<o:p></o:p></=
span></p>
        </div>
        <div>
          <p class=3D"MsoNormal" style=3D"text-align:left" align=3D"left"=
><span
              style=3D"font-family:=E5=AE=8B=E4=BD=93;color:black" lang=3D=
"EN-US">=C2=A0</span><span
              style=3D"font-family:&quot;=C3=8E=C2=A2=C3=88=C3=AD=C3=91=C3=
=85=C2=BA=C3=9A&quot;,serif;color:black"
              lang=3D"EN-US"><o:p></o:p></span></p>
        </div>
        <p class=3D"MsoNormal" style=3D"text-align:left" align=3D"left"><=
span
style=3D"font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;colo=
r:silver"
            lang=3D"EN-US">2020-04-09
            <o:p></o:p></span></p>
        <div class=3D"MsoNormal" style=3D"text-align:left" align=3D"left"=
><span
style=3D"font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;colo=
r:silver"
            lang=3D"EN-US">
            <hr style=3D"width:91.5pt" width=3D"153" size=3D"1" align=3D"=
left">
          </span></div>
        <p class=3D"MsoNormal" style=3D"text-align:left" align=3D"left"><=
span
style=3D"font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;colo=
r:silver"
            lang=3D"EN-US">chunhui.jia
            <o:p></o:p></span></p>
        <div class=3D"MsoNormal" style=3D"text-align:center" align=3D"cen=
ter"><span
            style=3D"font-family:&quot;=C3=8E=C2=A2=C3=88=C3=AD=C3=91=C3=85=
=C2=BA=C3=9A&quot;,serif;color:black"
            lang=3D"EN-US">
            <hr width=3D"100%" size=3D"1" align=3D"center">
          </span></div>
        <blockquote
          style=3D"margin-left:0cm;margin-top:5.0pt;margin-bottom:5.0pt"
          id=3D"ntes-flashmail-quote">
          <div>
            <p class=3D"MsoNormal" style=3D"text-align:left" align=3D"lef=
t"><strong><span
style=3D"font-size:10.0pt;font-family:&quot;=C3=8E=C2=A2=C3=88=C3=AD=C3=91=
=C3=85=C2=BA=C3=9A&quot;,serif;color:black">=E5=8F=91=E4=BB=B6=E4=BA=BA=EF=
=BC=9A</span></strong><span
style=3D"font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;colo=
r:black"
                lang=3D"EN-US">"Tiger Liu(BJ-RD)" &lt;<a
                  href=3D"mailto:TigerLiu@zhaoxin.com"
                  moz-do-not-send=3D"true">TigerLiu@zhaoxin.com</a>&gt;<o=
:p></o:p></span></p>
          </div>
          <div>
            <p class=3D"MsoNormal" style=3D"text-align:left" align=3D"lef=
t"><strong><span
style=3D"font-size:10.0pt;font-family:&quot;=C3=8E=C2=A2=C3=88=C3=AD=C3=91=
=C3=85=C2=BA=C3=9A&quot;,serif;color:black">=E5=8F=91=E9=80=81=E6=97=B6=E9=
=97=B4=EF=BC=9A</span></strong><span
style=3D"font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;colo=
r:black"
                lang=3D"EN-US">2020-04-09=C2=A015:56<o:p></o:p></span></p=
>
          </div>
          <div>
            <p class=3D"MsoNormal" style=3D"text-align:left" align=3D"lef=
t"><strong><span
style=3D"font-size:10.0pt;font-family:&quot;=C3=8E=C2=A2=C3=88=C3=AD=C3=91=
=C3=85=C2=BA=C3=9A&quot;,serif;color:black">=E4=B8=BB=E9=A2=98=EF=BC=9A</=
span></strong><span
style=3D"font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;colo=
r:black"
                lang=3D"EN-US">OpenBMC : KVM over IP and media redirectio=
n
                function<o:p></o:p></span></p>
          </div>
          <div>
            <p class=3D"MsoNormal" style=3D"text-align:left" align=3D"lef=
t"><strong><span
style=3D"font-size:10.0pt;font-family:&quot;=C3=8E=C2=A2=C3=88=C3=AD=C3=91=
=C3=85=C2=BA=C3=9A&quot;,serif;color:black">=E6=94=B6=E4=BB=B6=E4=BA=BA=EF=
=BC=9A</span></strong><span
style=3D"font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;colo=
r:black"
                lang=3D"EN-US">"<a href=3D"mailto:openbmc@lists.ozlabs.or=
g"
                  moz-do-not-send=3D"true">openbmc@lists.ozlabs.org</a>"&=
lt;<a
                  href=3D"mailto:openbmc@lists.ozlabs.org"
                  moz-do-not-send=3D"true">openbmc@lists.ozlabs.org</a>&g=
t;<o:p></o:p></span></p>
          </div>
          <div>
            <p class=3D"MsoNormal" style=3D"text-align:left" align=3D"lef=
t"><strong><span
style=3D"font-size:10.0pt;font-family:&quot;=C3=8E=C2=A2=C3=88=C3=AD=C3=91=
=C3=85=C2=BA=C3=9A&quot;,serif;color:black">=E6=8A=84=E9=80=81=EF=BC=9A</=
span></strong><span
style=3D"font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;colo=
r:black"
                lang=3D"EN-US"><o:p></o:p></span></p>
          </div>
          <div>
            <p class=3D"MsoNormal" style=3D"text-align:left" align=3D"lef=
t"><span
style=3D"font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;colo=
r:black"
                lang=3D"EN-US">=C2=A0<o:p></o:p></span></p>
          </div>
          <div>
            <p class=3D"MsoNormal"><span style=3D"color:black" lang=3D"EN=
-US">Hi,
                experts:<o:p></o:p></span></p>
            <p class=3D"MsoNormal"><span style=3D"color:black" lang=3D"EN=
-US">I
                have a question about KVM over IP and media redirection
                function.<o:p></o:p></span></p>
            <p class=3D"MsoNormal"><span style=3D"color:black" lang=3D"EN=
-US">Intel
                provided a RMM lite component, which provided KVM/Media
                redirection capability.<o:p></o:p></span></p>
            <p class=3D"MsoNormal"><span style=3D"color:black" lang=3D"EN=
-US"><o:p>=C2=A0</o:p></span></p>
            <p class=3D"MsoNormal"><span style=3D"color:black" lang=3D"EN=
-US">So
                my question is:<o:p></o:p></span></p>
            <p class=3D"MsoListParagraph"
              style=3D"margin-left:18.0pt;text-indent:-18.0pt"><span
                style=3D"color:black" lang=3D"EN-US">1.</span><span
                style=3D"font-size:7.0pt;font-family:&quot;Times New
                Roman&quot;,serif;color:black" lang=3D"EN-US">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
              </span><span style=3D"color:black" lang=3D"EN-US">OpenBMC +=

                AST2500 Chip, could not implement KVM/Media redirection
                capability?<o:p></o:p></span></p>
            <p class=3D"MsoListParagraph"
              style=3D"margin-left:18.0pt;text-indent:-18.0pt"><span
                style=3D"color:black" lang=3D"EN-US">2.</span><span
                style=3D"font-size:7.0pt;font-family:&quot;Times New
                Roman&quot;,serif;color:black" lang=3D"EN-US">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
              </span><span style=3D"color:black" lang=3D"EN-US">If wantin=
g
                to use KVM/Media redirection ,must buy a RMM component?<o=
:p></o:p></span></p>
            <p class=3D"MsoNormal"><span style=3D"color:black" lang=3D"EN=
-US"><o:p>=C2=A0</o:p></span></p>
            <p class=3D"MsoNormal"><span style=3D"color:black" lang=3D"EN=
-US">I
                found OpenBMC had implemented KVM over IP capability.<o:p=
></o:p></span></p>
            <p class=3D"MsoNormal"><span style=3D"color:black" lang=3D"EN=
-US"><o:p>=C2=A0</o:p></span></p>
            <p class=3D"MsoNormal"><span style=3D"color:black" lang=3D"EN=
-US">Thanks<o:p></o:p></span></p>
            <p class=3D"MsoNormal"
              style=3D"margin-bottom:12.0pt;text-align:left" align=3D"lef=
t"><span
style=3D"font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;colo=
r:black"
                lang=3D"EN-US"><o:p>=C2=A0</o:p></span></p>
            <div>
              <p class=3D"MsoNormal"
                style=3D"text-align:left;line-height:10.0pt" align=3D"lef=
t"><span
                  style=3D"font-size:10.0pt;font-family:=E5=AE=8B=E4=BD=93=
;color:#595959">=E4=BF=9D=E5=AF=86=E5=A3=B0=E6=98=8E=EF=BC=9A<span
                    lang=3D"EN-US"><o:p></o:p></span></span></p>
            </div>
            <div>
              <p class=3D"MsoNormal"
                style=3D"text-align:left;line-height:10.0pt" align=3D"lef=
t"><span
                  style=3D"font-size:10.0pt;font-family:=E5=AE=8B=E4=BD=93=
;color:#595959">=E6=9C=AC=E9=82=AE=E4=BB=B6=E5=90=AB=E6=9C=89=E4=BF=9D=E5=
=AF=86=E6=88=96=E4=B8=93=E6=9C=89=E4=BF=A1=E6=81=AF=EF=BC=8C=E4=BB=85=E4=BE=
=9B=E6=8C=87=E5=AE=9A=E6=94=B6=E4=BB=B6=E4=BA=BA=E4=BD=BF=E7=94=A8=E3=80=82=
=E4=B8=A5=E7=A6=81=E5=AF=B9=E6=9C=AC=E9=82=AE=E4=BB=B6=E6=88=96=E5=85=B6=E5=
=86=85=E5=AE=B9=E5=81=9A=E4=BB=BB=E4=BD=95=E6=9C=AA=E7=BB=8F=E6=8E=88=E6=9D=
=83=E7=9A=84=E6=9F=A5=E9=98=85=E3=80=81=E4=BD=BF=E7=94=A8=E3=80=81=E5=A4=8D=
=E5=88=B6=E6=88=96=E8=BD=AC=E5=8F=91=E3=80=82<span
                    lang=3D"EN-US"><o:p></o:p></span></span></p>
            </div>
            <div>
              <p class=3D"MsoNormal"
                style=3D"text-align:left;line-height:10.0pt" align=3D"lef=
t"><i><span
                    style=3D"font-size:10.0pt;font-family:&quot;Times New=

                    Roman&quot;,serif;color:#595959" lang=3D"EN-US">CONFI=
DENTIAL
                    NOTE:
                  </span></i><span
                  style=3D"font-size:10.0pt;font-family:&quot;Times New
                  Roman&quot;,serif;color:#595959" lang=3D"EN-US"><o:p></=
o:p></span></p>
            </div>
            <div>
              <p class=3D"MsoNormal"
                style=3D"text-align:left;line-height:10.0pt" align=3D"lef=
t"><i><span
                    style=3D"font-size:10.0pt;font-family:&quot;Times New=

                    Roman&quot;,serif;color:#595959" lang=3D"EN-US">This
                    email contains confidential or legally privileged
                    information and is for the sole use of its intended
                    recipient. Any unauthorized review, use, copying or
                    forwarding of this email or the content of this
                    email is strictly prohibited.</span></i><span
                  style=3D"font-size:10.0pt;font-family:&quot;Times New
                  Roman&quot;,serif;color:#595959" lang=3D"EN-US"><o:p></=
o:p></span></p>
            </div>
          </div>
        </blockquote>
      </div>
      <br>
      <br>
      <div style=3D"font-size:10pt; line-height:10pt; font-family:
        '=E5=AE=8B=E4=BD=93';color:#595959;">=E4=BF=9D=E5=AF=86=E5=A3=B0=E6=
=98=8E=EF=BC=9A</div>
      <div style=3D"font-size:10pt; line-height:10pt; font-family:
        '=E5=AE=8B=E4=BD=93';color:#595959;">=E6=9C=AC=E9=82=AE=E4=BB=B6=E5=
=90=AB=E6=9C=89=E4=BF=9D=E5=AF=86=E6=88=96=E4=B8=93=E6=9C=89=E4=BF=A1=E6=81=
=AF=EF=BC=8C=E4=BB=85=E4=BE=9B=E6=8C=87=E5=AE=9A=E6=94=B6=E4=BB=B6=E4=BA=BA=
=E4=BD=BF=E7=94=A8=E3=80=82=E4=B8=A5=E7=A6=81=E5=AF=B9=E6=9C=AC=E9=82=AE=E4=
=BB=B6=E6=88=96=E5=85=B6=E5=86=85=E5=AE=B9=E5=81=9A=E4=BB=BB=E4=BD=95=E6=9C=
=AA=E7=BB=8F=E6=8E=88=E6=9D=83=E7=9A=84=E6=9F=A5=E9=98=85=E3=80=81=E4=BD=BF=
=E7=94=A8=E3=80=81=E5=A4=8D=E5=88=B6=E6=88=96=E8=BD=AC=E5=8F=91=E3=80=82<=
/div>
      <div style=3D"font-size:10pt; line-height:10pt; font-family: 'Times=

        New Roman';color:#595959;">
        <i>CONFIDENTIAL NOTE: </i></div>
      <div style=3D"font-size:10pt; line-height:10pt; font-family: 'Times=

        New Roman';color:#595959;">
        <i>This email contains confidential or legally privileged
          information and is for the sole use of its intended recipient.
          Any unauthorized review, use, copying or forwarding of this
          email or the content of this email is strictly prohibited.</i><=
/div>
    </blockquote>
    <br>
    <div class=3D"moz-signature">-- <br>
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <title></title>
      <font color=3D"#1F497D"><font face=3D"Century Gothic">Johnathan Man=
tey<br>
          <small>Senior Software Engineer</small><br>
          <big><font color=3D"#555555"><small><b>azad te</b><b>chnology
                  partners</b></small><br>
              <small><font color=3D"#1F497D"><small>Contributing to
                    Technology Innovation since 1992</small></font><small=
><br>
                  <font color=3D"#1F497D">Phone: (503) 712-6764<br>
                    Email: <a href=3D"mailto:johnathanx.mantey@intel.com"=
>johnathanx.mantey@intel.com</a></font></small><br>
                <br>
              </small></font></big></font></font> </div>
  </body>
</html>

--------------5059704AFDD4777C65630ED5--

--956xsmcQy1tBdP3SRUMCgvAV05t1IKd4Z--

--o7RlyxGygYUafcG9SuJthZum5mjkTTSMD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEVa822oZtYaVqAzq50EfviT3fHwkFAl6POeYACgkQ0EfviT3f
HwngIgf+MbrztVdNTUtn45Ljkt0q56lLCAuJUI/1lpikYdhnw68MeUSt1h6vGFVa
XOA49D5+l922t9QRyHEHTi2vhoRlgufDMvr65IXzMDsXFdcRvCLpatA1Ntt0MF7d
jkNm7/bxSu6fvgatjwiDyKcf/KnIFFQCzJNU+1VBY9lmb/93L1UEGWQ5mlqvhJ6P
XrvT2zoyE3PJf7SHdauUNsJm6t0+CowjhxnPtWf6jcnGoyy1iSOJdDMNqNxZzbcq
kPRmKnThpniL+65NbyetAHwv6CfzTaatTH2Oi+H8Auk5c3cBr/Ec/fkXzGa8quYZ
6sdV9wIDIYHY1Z98x9vBBt7Eli6E+g==
=b4Cg
-----END PGP SIGNATURE-----

--o7RlyxGygYUafcG9SuJthZum5mjkTTSMD--
