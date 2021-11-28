Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B55460A4A
	for <lists+openbmc@lfdr.de>; Sun, 28 Nov 2021 22:23:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2M0f69h0z2xRn
	for <lists+openbmc@lfdr.de>; Mon, 29 Nov 2021 08:23:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=O5zWn1h0;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=FcCCZj+F;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=O5zWn1h0; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=FcCCZj+F; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2M0935jRz2xDV
 for <openbmc@lists.ozlabs.org>; Mon, 29 Nov 2021 08:23:04 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 49C375C00DB
 for <openbmc@lists.ozlabs.org>; Sun, 28 Nov 2021 16:22:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 28 Nov 2021 16:22:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:mime-version:content-type; s=
 fm3; bh=3ITeRQYD6BPpjG4XsgEQDz3iU93lWGozS5XI4TsLNnw=; b=O5zWn1h0
 QihO9SqxnlRVULkctUWqo11KcsuSPNYZR/AEJSChvwf9PyQNIfyCoYCytQ1YIxrS
 eaxbXS9p92h2Xb4MG4w0nOmOACCShJBnmflpu0+FiMvYGz77qqcCFGl4fdj75xO6
 uPpOFgMTy9wk7LQLgu2O0H9YuGSgbvIBc0JlHXsaZpJp8rYdM1TNVAZCkt8dxQS3
 nuHmWmVgBQbOSsj6fL72FEVZEATfDaUaLR+nDTfTr5qv6PKrmzizWGP8z32A+53h
 +zTILAQIlPJKhfyu6UJfK7BY52/qtpYE5YUI82PIWKE4cTqP+37E+KdfSHmqlatN
 uNoxWiLX+DftgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=3ITeRQYD6BPpjG4XsgEQDz3iU93lW
 GozS5XI4TsLNnw=; b=FcCCZj+F/Ms2Xx4H9M1b5MA9Yk3Cinum3LgS+iJoNR3sT
 UmLTDF/TyQ2Is0cCp57c94EQP51g9N8tnLjBRAUlLtRkpRzUHM3HsghqSEdz+COj
 paYJ/lpBrhyCIMroPa4QDc8YTIlJf8/hFKzGUyfZ6h2LvKdMe4qpXxGXwqz/E6dr
 c4zpow4Qm+x5c9K7LjplyxCSS03WH8+JZ8S9KNmhGpxlkbvmZl1Y+ju90d0TSTuC
 AqE+sxiKRq3MhCA5Ki3J9L/4d8Mz43+bMO3WCeWsIOj280jinu64txQleOl1bXBH
 L84AA8t39oX5BrK8SnaKuwZ5CdDjRp0/HfCThqWLg==
X-ME-Sender: <xms:MvOjYSubrIpGsaiDqbbAuJK-aFt0nTaXCQs61UgSR5mlwbMXd8NPyQ>
 <xme:MvOjYXfPgLxdWqxdVQAvaVpQKVolv_OcY_sIH4HFrt2cmknkwkmJ9DGmX3KIaMx-R
 0AoAKfJ6YmPtpSgjTA>
X-ME-Received: <xmr:MvOjYdyXUWgIp_rasfj5LLqj0z3Fvqt0bi15KTget7Anj4kHMpbfZrop2b-f96ZRgiK4wlaV96VMQWXIFY8CBxpiSiFVPX1yC-s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrheeigdduhedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvden
 ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
 gtgidrgiihiieqnecuggftrfgrthhtvghrnhepffetvddtieehieehjeeitdejvdelgfdt
 ffeltdfgveeutedugfekudeihedviefgnecuffhomhgrihhnpehophgvnhgsmhgtqdhprh
 hojhgvtghtrdighiiipdhgihhthhhusgdrtghomhdphihouhhtuhgsvgdrtghomhenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitg
 hksehsthiftgigrdighiii
X-ME-Proxy: <xmx:MvOjYdO84MRDVL5oJeLjQmih0w0Px1PMCWl7YWis3l3jhFSWp6_dSw>
 <xmx:MvOjYS-8HQbjO1Ujxms-NAj-zz4BT3YU8BKfYzZGUVhMStVOxniP_Q>
 <xmx:MvOjYVX29Q_MX2-OCAM2jkd_vtWzrHe87VTUJMo1Hz1mU7UBQaLTCQ>
 <xmx:M_OjYTLabKJUYfP7uhMVQc-Izr-U9L56kcqK9JCB-g-Qj7-kUas5gQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Sun, 28 Nov 2021 16:22:58 -0500 (EST)
Date: Sun, 28 Nov 2021 15:22:57 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: C++ co-routines are coming soon...
Message-ID: <YaPzMYi/UHwvEiGf@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZE80Bit118szcPIe"
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


--ZE80Bit118szcPIe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I just pushed up some code I've been working on for initial community previ=
ew:
C++20 coroutine support in sdbusplus[1].  This code should be considered
"experimental" for the time-being but a good preview of where I plan to tak=
e the
sdbusplus bindings.  I know there are complaints about the current sdbusplus
support in one of three veins depending on your perspective of importance:

    1. The current sdbusplus server bindings in phosphor-dbus-interfaces are
       synchronous.
    2. There are no sdbusplus client bindings in phosphor-dbus-interfaces.
    3. The code using the sdbusplus Boost/ASIO interfaces is very callback
       intensive (and difficult to read).

I've been wanting to leverage C++20 coroutines for quite a while in order to
address these shortcomings but haven't gotten around to it due to lack of
understanding on my part (and lack of time to fix this) and lack of maturit=
y in
the library support.  There is a proposal for C++23 (P2300)[2] which attemp=
ts to
fix the "maturity" problem and the authors of that have been using libunife=
x[3]
as their proving ground.  Using libunifex and becoming enlightened by Eric
Niebler's excellent talk at CppCon'21, I've finally been able to make some =
good
progress on this.

There will be more to come, but I wanted to give a taste of what a C++20
co-routine-based sdbusplus agent might look like.  This is an example of a
task that reacts to D-Bus "NameOwnerChanged" signals:

```
auto watch_events(sdbusplus::async::context_t& ctx)
    -> sdbusplus::execution::task<void>
{
    using namespace sdbusplus::async::match;
    auto m =3D match(ctx, rules::nameOwnerChanged());

    while (auto msg =3D co_await m.next())
    {
        std::string service, old_name, new_name;
        msg.read(service, old_name, new_name);
        if (!new_name.empty())
        {
            std::cout << new_name << " owns " << service << std::endl;
        }
        else
        {
            std::cout << service << " released" << std::endl;
        }
    };

    co_return;
}
```

I currently have `match` implemented and I plan to get `call` working very =
soon.
Sometime between now and late January I'll probably do an educational talk =
on
co-routines.

1. https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/49117
2. https://github.com/cplusplus/papers/issues/1054
3. https://github.com/facebookexperimental/libunifex
4. https://www.youtube.com/watch?v=3DxLboNIf7BTg

--=20
Patrick Williams

--ZE80Bit118szcPIe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmGj8y8ACgkQqwNHzC0A
wRkbDBAAiWW8p0rnlkD8bEE29WC0rh3dMvffWFxxYqKISCW2zqvWPBWSZ3Re3JQm
eeDeP5YgApU6b+XkJX+h/tz3Fy6pxpYRaGVpFOCaNodhWmmaTzk5EZBY63OyKgXn
vUcb9R04ZwVLXAZjkM+YwpA1lqq4glSiDp89DodP0LL9ILH/pVEFP2/S08PpWbwj
+cgKuZjRc4IklBzQy2rLIDaF9NgrgXIwrevb62MDP4DDcVBaAkK1T6jLJB7UA4kA
pW+H59DjGfTxEm5ebWBhghS6p/+7d6rz+VLdLbcrhtRkEpTft17n78T7Y/c8Nilj
8XSKmyx+GzOy4digsiqGaXkTNrECW5mW3AMmTC5WElRBkCre69AQl4pKKMSGnRfW
pMlGqMIiCNYOjhq16V/L1UojBTxPPuh8FnvQxO3to87Q0w9czNWcmhV22wTsHk/6
GCJLJAqaBAAjV3XMcnF/ErZoxD60hDi0SSOujU4/1dfEtpO1KZxo8p3EfDav40yL
HYA8LbPaVFdZQSdtSLUTmWxpTXKjzT13DqRavvWXq5q8DA7vNb34ixTJr4vx/s8s
nNSvqUyxuBO15GK5+BiDkcpbkRQKyFfci03O+2vI+FghCto88kjdwdzj/XwP8x43
7N0OqQZ/7nxc6A8n5ls+IaQwCQ58qnXrkjOdfPe+H1ABBTnoubs=
=9gaH
-----END PGP SIGNATURE-----

--ZE80Bit118szcPIe--
