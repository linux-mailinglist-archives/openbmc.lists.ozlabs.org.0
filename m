Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 622BC31A478
	for <lists+openbmc@lfdr.de>; Fri, 12 Feb 2021 19:22:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DchgL63Q1zDwtg
	for <lists+openbmc@lfdr.de>; Sat, 13 Feb 2021 05:22:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=r8dIFfv/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=awAFjvYn; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DchfM1zHWzDwss
 for <openbmc@lists.ozlabs.org>; Sat, 13 Feb 2021 05:21:45 +1100 (AEDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id A4431C10;
 Fri, 12 Feb 2021 13:21:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Fri, 12 Feb 2021 13:21:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=QS/tkjk5NUiWmWrFgIPCnl1XD4V
 UlhrdD6p0bARg76A=; b=r8dIFfv/BEwA5V31CjXiF5mp4++hfQG9yJmOOzUTQDY
 lJI6Wej7y/zNwxTHwrO1xmy9gYhxh9PLibn6Q8mASYKI9zh1grbYSdQ3gmDzirsb
 xiunyMWL84OuZ7QX01/baOwon6/ut6r+eRGFOZFlunMYbMXCDsjDwB8BM61oClkj
 tZWl1RXKCzGIiZonUHr4jeVTycP3L4jM4wksQijm65mYGWG9vgYBJKOFVck+pfJu
 3deMqAKzD4LXoq1XHdbD4H8PeVDas+n9dXuFYsrOzafWmLMhixwjwhvSdN7AVWXk
 xoi28ynm3OAzNHpTF97AT/5isfagqcNp2RoeLw6mxvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=QS/tkj
 k5NUiWmWrFgIPCnl1XD4VUlhrdD6p0bARg76A=; b=awAFjvYneH4kV2D7KRVufK
 vEKZgsP2vbHhYZAI8V2KNogjCC+63S7xasR6fmh+TeoDLlT1fzyKJAQMIPnx1ZTE
 GjbJZCvX1yjGx9UqtvVWheeoiL2NlKmyJVLt3Z8u7KMBzA1iD89zUWA6dBgMcZ+5
 v4RtUfxDvCTqptM1YfJcZVsxb9y+Hbxdbr3ktwTm8XSGG4DknUjmino2SdKGDm+o
 afFEG0awR1fKHqDt6J+18KJq0AXCN03WpWmaU0m3+Wiquw3thTU14lLSvgIaZ0He
 6bEbpTsEeBSpUva6YFQWvLtnY4+yYfEmVYQ9FeL6egWVQJKpVoW1rZGnDJhOXgFg
 ==
X-ME-Sender: <xms:MccmYCSGnhUNDWwsHVEOPqbiCd4hEM1AVVva1pKM8p4f6uBVXnmnXA>
 <xme:MccmYB2AHRupueiEkYCRNL-f702_M_VvJ-77zkGegCw6OBi1NVFAYUIDu8SxceXwS
 fDROiznI9Es5Dzr24I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledriedugdduudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeeh
 leefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:MccmYEzmD1snL9v5fFcRUp1EQF0EF4t5r1AtOLF962viHXakaJy9bw>
 <xmx:MccmYFw5q75TTnDHpKU5KCjiVaET6Lahd4BSC-Z89-N6rvOJzfMaVQ>
 <xmx:MccmYI8HBkutw3AI5nnV2tqt_FPew-59A4HrhTXfnLWK4SSKNeMvKw>
 <xmx:MscmYHRXeIOoqv1p4J3nhw5uHBmOqF-U2UsnMHp8j4o2grKUe6SSwQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 401511080059;
 Fri, 12 Feb 2021 13:21:37 -0500 (EST)
Date: Fri, 12 Feb 2021 12:21:35 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: Re: Upcoming enhancements to `run-unit-test-docker`
Message-ID: <YCbHLxM5XaRcIJ8L@heinlein>
References: <YCXLqK7KgvwYwWDl@heinlein>
 <80c3bd03-7cdf-a22a-b5cb-ee05915ab04c@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QP05S6W61xstg4Ne"
Content-Disposition: inline
In-Reply-To: <80c3bd03-7cdf-a22a-b5cb-ee05915ab04c@intel.com>
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--QP05S6W61xstg4Ne
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 12, 2021 at 08:22:02AM -0800, Johnathan Mantey wrote:
> On 2/11/21 4:28 PM, Patrick Williams wrote:
> I tried using this script a day or two ago. I needed to fix some unit=20
> tests for a commit I pushed earlier this month. I had used the script in=
=20
> the past and couldn't remember how to use it.
>=20
> A year ago I had to fix some unit tests, and I had to get Docker, and=20
> this test script configured. I have long since forgotten how I got the=20
> system setup, so I went back to try and run the unit tests I had fully=20
> configured and running from a year ago. In spite of having a fully=20
> configured environment I could not figure out how to run the tests any=20
> longer.
>=20
> I decided to find the run-unit-test-docker.sh contents on the github=20
> repos, to see if I could read prepared content for how to configure, and=
=20
> run the unit test script. The readme.md is one line. The comments in the=
=20
> shell script assume you know what each settable parameter does, and how=
=20
> it is to be assigned.

Andrew Jeffery pointed out this document last night:
    https://github.com/openbmc/docs/blob/master/testing/local-ci-build.md

I have all of my repositories cloned into a single subdirectory, which
makes using this script much easier than if they were spread out.
You'll see the doc above references as `/path/to/ci_test_area` and doing
additional clones / git-worktrees, but if you just keep everything
cloned in one sub-directory that *is* the ci_test_area / WORKSPACE.

I typically run this little helper script from a repo I want to test:

$ which lf-ut
lf-ut () {
	REPO=3D"$(git rev-parse --show-toplevel)"
	UT_PATH=3D"$(wd path obmcsrc)/openbmc-build-scripts"
	UNIT_TEST_PKG=3D"$(basename $REPO)" WORKSPACE=3D"$(dirname $REPO)" "$UT_PA=
TH/run-unit-test-docker.sh"
}
$ EXTRA_UNIT_TEST_ARGS=3D"--noformat" lf-ut

I use zsh, so ... Anyhow, `wd path obmcsrc` is the path to my workspace
where all the code is extracted.

> I'm pretty sure I had 1:1 assistance from someone familiar with the test=
=20
> configuration to get this to work. The effort involved is more than "get=
=20
> docker, run script".
>=20
> I request that someone familiar with the configuration and operation of=
=20
> this script please provide information about how to get the environment=
=20
> configured, and some example use cases for running the system. One place=
=20
> in particular that I found difficult/impossible was to run a test on=20
> code that required changes in other repositories. For example, if=20
> phosphor-network needed changes that are provided by=20
> phosphor-dbus-interfaces how would you configure the test run to be=20
> successful?

Right now there isn't a way to test two repositories together.  This is
an aspect I mentioned of wanting to improve (at least for Gerrit).  Your
only option right now is:

   1. Push your phosphor-dbus-interfaces change to Gerrit.
   2. Edit `scripts/build-unit-test-docker` and insert a "rev" keyword
      under "phosphor-dbus-interfaces" with your git commit hash from
      step 1 (this should hopefully be obvious when you look at the
      script).
   3. Run something like `lf-ut` above from inside phosphor-network.

** Step #2 assumes you're running my new versions of the script **

Hope this helps!

--=20
Patrick Williams

--QP05S6W61xstg4Ne
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmAmxy0ACgkQqwNHzC0A
wRlyUA/+KjWuAiLYdZ2bPvdXZCGpNZ+d+nl8cksDSNgy6kSqiKL/HL380IlGMKg4
k7SaVb+ljOCj9ulKOTIopZ36un2SEp8pZLP8CgfN0zigCGaQJ25kkNkjhm6clZFI
Wse7kH4FLvKfkOmI7eTPNRrUNVfKXDoTrdnBnxBnygDVBZ97qJtkzK+cAU8ytrC8
nso2VYTbjT/qU3MDKPY5slwtdX12Tg4n9XI3jQqql0yKcn3pAWct/hrsNNHa/zQa
9lQcr5uk/g0GMfg6doDbfW6latCDI7vTTvaa8GT4B6snX0bV6sA3YcVpaYM9uL5w
hKIt2CsfFzpio7ywBVikWykyU3tZxVgQKBN8tg8dmfyjEzlg3UB8dwHgQLW/qQKv
mdYmFfeLT/8i0XZ179L+YuXXhxqPxy0NF2RrM09Bskb7JmoTH3J25vhCNI+142kH
Ik8YGiYko+1pLaxSCFh7ApEtWxl8+JVJ2kH9nZQCGofI2zCEcJYsPsD8EQlzOurr
Qx9G5f5Nc9QKOQVZlPl4E/sCCot6OYRCHs4Q4QBmmOJdELtq87ngTP3Uw8KETB8U
WNR0WkRgWNQvGZoBO4oAN7bgcL7b8fdVsWIvWimfMOQxHnWzHMowrhxHadQ6Egca
sDJlKHIxctRgTwTVmeLkvADvIEohsiIuaKBtv0eEUxHyi06p5lI=
=krEu
-----END PGP SIGNATURE-----

--QP05S6W61xstg4Ne--
