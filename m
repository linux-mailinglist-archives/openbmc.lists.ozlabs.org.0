Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 581C4362334
	for <lists+openbmc@lfdr.de>; Fri, 16 Apr 2021 16:58:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMK8m2M42z3byV
	for <lists+openbmc@lfdr.de>; Sat, 17 Apr 2021 00:58:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=y4iEw+0r;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Cs3CMZ3/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=y4iEw+0r; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Cs3CMZ3/; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMK8K5cZMz3bvK
 for <openbmc@lists.ozlabs.org>; Sat, 17 Apr 2021 00:58:08 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3F3705C00AF;
 Fri, 16 Apr 2021 10:58:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 16 Apr 2021 10:58:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=5AnvCyoyptU5x5NtdQcpBAJXihE
 0B2I0/0hzmrnD/M0=; b=y4iEw+0rOD/x8gL1A3A6xDBONafYFdw7GFQv9w0921J
 +2tLHJdsUjeXJZrfF8n0YtAnLxNkQAbTmCePEInoTRoa3CyWLf7c8C4WBito29Rq
 aKv/l2heVnxwQG15jIadK0eCc5vqLN4tFeI3Mukys2OSYl82OCFVOa7mulqhMHGC
 Y1PWvzeCvJcmPfUA1PME0/vnZfWMOd39TeXhQS1rP4O/7/abd8QcRIvbbJo1yUvo
 epGXqZsRyGyyT4krxp8MCgvBET0ZhN2Il4nDVjRYawd6FXbdG3iC4ocdY86QNhaM
 bX0neiX4yf70/396/pmgc53qXitLVj/aEb4ZOivrzJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5AnvCy
 oyptU5x5NtdQcpBAJXihE0B2I0/0hzmrnD/M0=; b=Cs3CMZ3/onGctWPW1A0Tkn
 utp7WTHtF6k9SS5Yu6GSBm69QyOWq1dFt8nTuYph2zb3yQx20yul0bMxzblJ8o8+
 /FiWYwDxDZIb/CKmck/IxMq8GhbiiEcY8p3NWAuhIxEzn+AOQpNee6GCxv7V1J66
 6QfZJqfsKkdHBiR3QQzssrt3pXmaazWZhocMPT/XWLoAc9W9vDGMMAVB/1aT+sE5
 hnPLXI5P6SMIRi06B68GN9dL05FgSwoxsm3NwRK2/xHUIDXVJPT3sHVxf83/NhLm
 C0c0P5pmscIBIjXheZD4KGPpsQwxTWgLLnmwvxw53eOoCfqSXVkpIT1sr84tZ5zA
 ==
X-ME-Sender: <xms:_KV5YKhmjpgFUYWoHJnBnAhdeVT0_kZqGuwvitm_cpzI12fnO-KDfQ>
 <xme:_KV5YLDBsn9RJArSRgAWu2QJBJRxieMwSpu1CclhuvRtzU3CQXOFL-xNdE_IKGCD7
 AZ4KeaQA7ZNgmY9pOM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudelhedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 jeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepkeduuedtfeeihfehfeehfedvjeeu
 jeeikedtteehledvhfelheekgedvieevkefhnecukfhppedutdejrdelvddrheelrddvud
 ejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:_KV5YCHwwB48wxqMIuvVV2nR9Zzhu5APX2OfhcsISMWJdaJ5WY_jEA>
 <xmx:_KV5YDRQM7HvNdv_yBnR8rO3BtEb3jiTE7rzr1U3dbnC91drlzIEyw>
 <xmx:_KV5YHyiG9HBXRu0ivxMwMu5Omco6Y-U0oe0VkQYegzALozxhDlfmQ>
 <xmx:_aV5YAquSLVxr6NnQ30SrltGyF_2wupXjk_-zMlf8QwPSAy2-bfNdg>
Received: from localhost (mobile-107-92-59-217.mycingular.net [107.92.59.217])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6D8AE1080057;
 Fri, 16 Apr 2021 10:58:04 -0400 (EDT)
Date: Fri, 16 Apr 2021 09:58:03 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Bruce Lee =?utf-8?B?KOadjuaYgOWzuyk=?= <Bruce_Lee@quantatw.com>
Subject: Re: How to get the return value using the command busctl set-property?
Message-ID: <YHml+7IYIVEXYo6M@heinlein>
References: <PSAPR04MB42315F65948C859527E5D8E2F84C9@PSAPR04MB4231.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cBG35bXSpcBvGbf2"
Content-Disposition: inline
In-Reply-To: <PSAPR04MB42315F65948C859527E5D8E2F84C9@PSAPR04MB4231.apcprd04.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "edtanous@google.com" <edtanous@google.com>, Nan Zhou <nanzhou@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--cBG35bXSpcBvGbf2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 16, 2021 at 04:46:00AM +0000, Bruce Lee (=E6=9D=8E=E6=98=80=E5=
=B3=BB) wrote:
> Does busctl set-property can get its return value?
=2E..
> If can get its return value from set-property, how to do it?

There isn't really a return value from a set-property call; there is
only a possiblity of error.

If you look at 'man SD_BUS_PROPERTY' you'll see the function type
for a property set is:

       typedef int (*sd_bus_property_set_t)(sd_bus *bus, const char *path,
                                            const char *interface,
                                            const char *property,
                                            sd_bus_message *value,
                                            void *userdata,
                                            sd_bus_error *ret_error);

This is where the 'int' return you're seeing from these set-property
handlers coming from.  The way systemd handles the return code is that
any negative number becomes a negative errno style value that systemd
turns into an appropriate error message back across the dbus.  There is
a paragraph in the manpage with more details:

       If a callback was invoked to handle a request that expects a reply a=
nd
       the callback returns a negative value, the value is interpreted as a
       negative errno-style error code and sent back to the caller as a D-B=
us
       error as if sd_bus_reply_method_errno(3) was called. Additionally, a=
ll
       callbacks take a sd_bus_error output parameter that can be used to
       provide more detailed error information. If ret_error is set when the
       callback finishes, the corresponding D-Bus error is sent back to the
       caller as if sd_bus_reply_method_error(3) was called. Any error stor=
ed
       in ret_error takes priority over any negative values returned by the
       same callback when determining which error to send back to the calle=
r.

The *best* way for a set-property handler to return an error is to use
the sd_bus_reply_method_error or fill out the ret_error with
sd_bus_error_set.  Both the ASIO object_server.hpp and the
sdbus++-generated server bindings catch excpetions thrown out of the
set-property handlers and turn them into sd_bus_error_set calls.

Other than the negative value indicating a errno, the positive value has
no meaning and does not do anything at a dbus level.

--=20
Patrick Williams

--cBG35bXSpcBvGbf2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmB5pfkACgkQqwNHzC0A
wRnbzA//V9OJbOORjX5tOC3aILv0KpQVwdaqRzRLG1rbpfCLHm9i1BK9uDeyOxSR
TzM6iFCaeY/AQOUtqEmkb+a16mh2QWcJ/HC+6pregR6Em2jYkbb/YALb7Wvv/cnT
YKm3X3ICq2spVLxJb+bgDeN98dfNSvug9EJefSTT8kbz20SOmGrLzT7wPanz8uDv
Rjs+J9FkiNvAR1/TF8r1asAI2bbqQ99Ozdsa6iKpqyxVBKsqw8ttNT9Ik/NBXzZp
Zr8sSbiKOU21s1nmOtH/TgxlBW3fKbLPo5LJHUTCp8zk5Lpwns4+IeZ2zn9U+SZA
y7pHC1lKr1Ks8j/MsoV27lon5ioIGcVcVjo2OFHhG0V9C3g5AIqKe42nOQMV8a1u
jZx3BjDkG0kOC+wHJWIQR+KVpg6OX2MloRSqZ9U1aAwPdm6mFQ3XaD8V0lQsNJL7
kd+QyI7ug8aVdTp/U6n+/JuP/1/flNl1tMzl2pynTp+V7Gpl0g2pvzedtV8HmkXx
ieiilKo8av3w0FxPFB1hS+twmiEQgem0ufajQSvmXV6w247zErMuiQ54VJutFok4
/sBTmo2EomcRW05mVMC9QqV1w6+qVYnqti9u8n/0y1GdOb1AMoVv4EGm3Bvra574
F/T9uUoM9P8Uyx0E9D3gteMq+K+AWtVvz7urnCWPadAfRPMLOf8=
=9LPH
-----END PGP SIGNATURE-----

--cBG35bXSpcBvGbf2--
