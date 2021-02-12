Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B09E53197A1
	for <lists+openbmc@lfdr.de>; Fri, 12 Feb 2021 01:52:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcFM467WVzDwvq
	for <lists+openbmc@lfdr.de>; Fri, 12 Feb 2021 11:52:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=dXJdEov/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=M7+Roh3u; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcDqz2BDzzDwtG
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2021 11:28:30 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 1EEF2A62
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2021 19:28:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 11 Feb 2021 19:28:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:mime-version:content-type; s=
 fm1; bh=aKSFxGs6x5W6u8VrYh1s6FWLyDQm2CZxRIUZM0AoKGA=; b=dXJdEov/
 843VrQ55sdd5gseVtEvO4ncTHKLUA6JNw4HVbbPhVDXsrdYvK7KEc5gE5aLVr2TH
 etrt7mMLDWRItZqskDAiXa7uw2VUxzvj6Pw9Izj3RKU7+HujS4Wnt8cN8/14Fvhd
 ZYpB1KaXuOSeSvsATe/ACo7wdzjQ4sLWtJ0Hn/iWfbE3x0DBVhXptyiC3aDtPhhv
 A/BtvwHjnUgaR19nFAAOsEtY2F+G6qY9sBs0w98folBv9PWdfy3cO+zJh3/CMc3A
 S/6RPLq7rRb3ypiEbk8R/kZETizq5NhJa58jJ/VNDi0aCdmQVtP9LAQF5oJpDMIh
 xgzzpD2wwHs9xA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=aKSFxGs6x5W6u8VrYh1s6FWLyDQm2
 CZxRIUZM0AoKGA=; b=M7+Roh3uDslpTEO+R6vYV/DnwuzNCOvp99jIdetq4X/7f
 mZTyzGxQFCj98iSeAvmDuCcBrZOnnmfoBvdYtxaIAqhSUIEI/3+72Qtoz0epA7bF
 NAfYfr3jfOC51+WAZQ01tTElHWR2Ecfh+CvzNz/mO4bq1wNXkte6m42gHmD7H9B5
 Cm4X6vnGua76jaw4B+5CG4Znz2dVqkbE/si4f+Ey09MbzeYQOt50v+AmPVn9xd75
 ZcMO30nT1hCP8/oM7p/vMFI02D180/2OEEDFZTDMNay37WhH+9EG3Ztp1obx6yj5
 d5/cLXwOSPgqNKUihvtMHiiXikMiu5y57h5TRhJHg==
X-ME-Sender: <xms:qcslYD2fSwaaOK4SX9RnAnEa0yZGxDdz5KlCfBMPWy_Rl88BMDec8Q>
 <xme:qcslYFOdoyTHqoqrsFfPDXEQWB20dA1RIP08swyrqlVjRee8JdOioaCSZJYHfQrtC
 L1Bh1ao-e37Yo_q0LU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledriedtgddvfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfggtggusehgtderredttddvnecu
 hfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsthiftg
 igrdighiiiqeenucggtffrrghtthgvrhhnpeeftdffvefggeelleehteelkefgheduhfej
 feeggeeifedutdehvdethfehveehvdenucffohhmrghinhepohhpvghnsghmtgdqphhroh
 hjvggtthdrgiihiienucfkphepudeiiedrudejiedruddvfedrudegfeenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsth
 iftgigrdighiii
X-ME-Proxy: <xmx:qcslYBUgx79TrpATiNZ5IRaJm4Z6oCPwTkTMgV6ajwkfE4N5OijySg>
 <xmx:qcslYNYFGmf8Y34rhsO1Zk3E5NQN9zlM2vj7QxUSPZF6eSZaU_sUEg>
 <xmx:qcslYEvud3d9sfggCAbMTjFORxZXZD-UZmrPTIS6f_SUXUwMLthBuQ>
 <xmx:qcslYIm7bK0FjCXpwHfp9C14jeXZUrvxInw4-qr7RYMPbnguexq9Xw>
Received: from localhost (mobile-166-176-123-143.mycingular.net
 [166.176.123.143])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6A253240066
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2021 19:28:25 -0500 (EST)
Date: Thu, 11 Feb 2021 18:28:24 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Upcoming enhancements to `run-unit-test-docker`
Message-ID: <YCXLqK7KgvwYwWDl@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UBSax1b/WBi387DV"
Content-Disposition: inline
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


--UBSax1b/WBi387DV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Inside openbmc-build-scripts is a tool which is used by Jenkins to run
repository-level CI and I think some developers also use it:
`run-unit-test-docker`.  I've rewritten a component of this, which is
now at `scripts/build-unit-test-docker`, in Python and done some
enhancements to it.  The [currently] last commit in this sequence is at
[1].

Important notices:

    - Location change: build-unit-test-docker.sh ->
      scripts/build-unit-test-docker
        + I suspect few people run this directly, but instead use
          `run-unit-test-docker` which hides the rename.

    - Python3.6 minimum.
        + Bitbake already requires this so it really shouldn't be a
          problem for anyone.

    - Python 'sh' module needed.
        + You can install this with the 'python3-sh' package on many
          distros or 'pip install sh'.

    - Docker stages are now tagged with different names / tag revs.
        + I wrote a `scripts/clean-unit-test-docker` which will clean
          out old Docker tags and can be ran periodically.

Major changes:

    - Rewrite in Python.
    - Significant speed improvements:
        - Docker stages all build in parallel to formulate the final image.
        - All Docker stages are tagged and reused from run to run.
        - CMake packages now use the Ninja backend.  This is the same as
          bitbake and faster than make.
    - Included packages are defined in a dictionary rather than as raw
      Dockerfiles.

Upcoming changes:

    - Shortly, I will add support to incorporate base package changes
      into the image itself.  We have had cases where a change to
      a common package like `sdbusplus` broke CI because a package that
      depended on it failed to compile with the changes.  I'll add code
      that uses some of the GERRIT_* environment variables to determine
      if the commit-under-test is part of one of the base packages and
      include it in the Docker image for the test run.

    - Topic-based testing.  We often run into co-dependencies between
      phosphor-dbus-interfaces and another repository.  Within the next
      month I'll enhance the script so that if you change PDI and your
      repository and tag the commit with the same topic, the PDI commit
      from that topic will be pulled into the Docker image so your
      repository commit can pass CI.

    - Some refactoring.  I did a lot of incremental changes from the
      original shell script to the Python version I currently have and
      didn't always rewrite in the most Pythonic way.  There will be
      some more, mostly non-functional, changes to fix this.

Feel free to comment on the review series if you have any concerns with
these changes.

1. https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/403=
66

--=20
Patrick Williams

--UBSax1b/WBi387DV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmAly6UACgkQqwNHzC0A
wRkkjw/9ESzu4KEMw+9dMrjyTLAAmfO9DBBTRyCC7H/ccgsbwrY/sH003O/br3Hn
VEvV4m/7cC/KFw0elVMTSJILUHyIcGjExLsI/YvhGdRFJ4Jz2mY0cTzEJhaj3Xg7
EB/HSoreRYRJH54K/13J7z5sP12yMk5G6UKB6xw5pGTf3X2QIVyrWnxc71Ht96xd
uwkIEcPkI4Nuj8ebk7Zu01ZMPeOe13kQH8ohyjsCJ2zgbcS2+N3hcSG2Jgl+0rw8
7F4Ao4ESdzIrLGrbB8hDzTpWKwjm7Q6jrLPaoK8NCetaWozGDSUAJWtAXw7WdOFd
M5usVjZDWahW2NFQKNMVroImapcaX6En+RpfUZV8rLhbRF8ffNoQK9jv98o3xxpB
s5fn/g9fFN8kWHk9qjpq4iZDEe3qJn6LijqTDkguD5Mfl0JBnIEaT9wyY2rNyycs
NvV64xcj1Fi93pla88YlopgpMnYsd5vRVHSvqJF/dMQ2Gtlw9CvdkhPBYEuqR8H/
TAUGN11FHWGZ6RqjESVL2bIrSBJ49oWShDeiZU1Ge7s847gjwY6zzqABW3tBCFvs
qBfX2+4Jn7rpTOr0V3fPQWq0mg0Mt1N6BTk+xRuJryoGel7ln5xLMOnYnXOsu9tm
7LErDSGZ3KHWs7Jrp4pn3+tfLJn/bOWRqq9JHDzr6vvov1zBrn8=
=6vR/
-----END PGP SIGNATURE-----

--UBSax1b/WBi387DV--
