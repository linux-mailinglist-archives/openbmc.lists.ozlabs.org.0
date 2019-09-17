Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8D3B44FA
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2019 02:53:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XPjR1wTgzF3dC
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2019 10:52:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cHJ000eJ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="M4BNBu+j"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XPdb2MhnzF3Zs
 for <openbmc@lists.ozlabs.org>; Tue, 17 Sep 2019 10:49:38 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7F15D732;
 Mon, 16 Sep 2019 20:49:34 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 16 Sep 2019 20:49:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm3; bh=hzJmy
 9GMbRjqaUQuzD9NCiaGXQD99eKO2zPyIUima7s=; b=cHJ000eJfaIeMz4H9zn7l
 n1N1JMv51w6Zn5U5YhTzFEzEqZofxmMjLJ1SGNvA1tJJS4HUEnzyU07lg0vsZtBP
 nwTH8FAT+w4+xBBsuQbT2IGkBFegKfYl37uGFlBNK+y34mNEaXQzUJ/3dGBTBxIx
 H3QAfde6gJq3sO4/EKlKAc4O16g0HErgGglP/sdm3RZp5Vfedw4aBY2P+kZuvbYz
 FJjeTCLy2WHkOXtzbxsT8Uu5G+3DpuufAGxjtCVa3PxbtRDLC1ya9fqJvwAlBPCD
 rxX0gO1gx/q5BmZh8NPB3HH8MzvsMSPjTDsnJqUXh/cMVS7CG7TstEwzPUAP/fH6
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=hzJmy9GMbRjqaUQuzD9NCiaGXQD99eKO2zPyIUima
 7s=; b=M4BNBu+jW0w+1abxDMAiCsyBK8F1zcQay8Veo99UNrvuzZyZrLFMsKOlX
 KKkYcm3KeY8cj3Ge6iGS9O/VekXU2tVZIeHHNdCOv5YkGUfIRsvNIgFXB+0ocFjK
 S+l747bKJQvJ4BKiJfRTaRgqEbDnhcSYYqhA6MgqzSP5XxkkFl3a3KoAYwacmdkY
 3OWWChJSlvjPBuGj22Vu+SPQGan3kW/AjF6TDL4KZbfwPnZAxcpVSm4/uOYHYny+
 juZ99cT+fKWYqtUgzx6nEaRO1Ujn6Ux3cFB6AEh3d1pI31hnz/INJuDGze8Vkzpw
 WRrGO0ljyWoHM6Hx7Ij2EbDYrwjcQ==
X-ME-Sender: <xms:nS2AXYJgp2CPgMOtQneNjouu1K2fHdrlTnJa26LUQaRF4_7sqNRMqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeggdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:nS2AXWp4MXp3irx7sl318PFvLFDxx0gQ2GvMjhrPpp13eWJUzUshzg>
 <xmx:nS2AXe656AIWNs8hBRcVGi_3yn2liljinDGUC8p0sigcuQ7JM1Nm7g>
 <xmx:nS2AXaKqzxxTpSLMzGvir23gU_HL2M7BeJckCzTGtjVGjEwqMIrYNw>
 <xmx:ni2AXRdjo7v8TVzAb5QXvx65Xhj4GencWxGhT3hSLlFujj8mVMe4Ig>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 881C8E00A9; Mon, 16 Sep 2019 20:49:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-237-gf35468d-fmstable-20190912v1
Mime-Version: 1.0
Message-Id: <d9129aae-feb4-4f50-8c1d-2646f0d5cf77@www.fastmail.com>
In-Reply-To: <18C166E9-70FB-4C8F-8FC9-CA1156696B03@fb.com>
References: <mailman.651.1568609107.9379.openbmc@lists.ozlabs.org>
 <18C166E9-70FB-4C8F-8FC9-CA1156696B03@fb.com>
Date: Tue, 17 Sep 2019 10:19:28 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Wilfred Smith" <wilfredsmith@fb.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Current Minimal Binary Size
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Hi Wilfred,

On Mon, 16 Sep 2019, at 23:40, Wilfred Smith wrote:
> >=20
> > Out of curiosity, how are you generating these results? For instance=
 using
> > the Ubuntu ARM GCC cross compiler I have a smallest executable of le=
ss
> > than half the size of what you list above:
> >=20
> > $ arm-linux-gnueabi-gcc --version
> > arm-linux-gnueabi-gcc (Ubuntu/Linaro 8.3.0-6ubuntu1) 8.3.0
> > Copyright (C) 2018 Free Software Foundation, Inc.
> > This is free software; see the source for copying conditions.  There=
 is NO
> > warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR P=
URPOSE.
> >=20
> > $ cat empty.c
> > int main(void)
> > {
> >        return 0;
> > }
> > $ make empty CC=3Darm-linux-gnueabi-gcc CFLAGS=3D-Os && arm-linux-gn=
ueabi-strip empty && ls -l empty
> > arm-linux-gnueabi-gcc -Os  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-n=
eeded  empty.c   -o empty
> > -rwxr-xr-x 1 andrew andrew 5544 Sep 16 13:08 empty
> > $ size empty
> >   text    data     bss     dec     hex filename
> >    759     276       4    1039     40f empty
> >=20
> > Admittedly it's not the SDK cross-compiler, but some more clarity
> > on how you came to those numbers would be helpful.
> >=20
> > Andrew
> >=20
>=20
> Andrew,
>=20
> So glad you replied.
>=20
> I=E2=80=99m doing a Bitbake build for a recipe that uses CMAKE:
>=20
> add_executable( sizetest.bin source/sizebin.cpp)
> target_compile_options( sizetest.bin PUBLIC -Os -s)
>=20
> I don=E2=80=99t know if it matters, but I=E2=80=99m compiling in CentO=
S 7 with the=20
> OpenBMC/OpenBMC tree and my TemplateConf set to=20
> meta-facebook/meta-tiogapass.
>=20
> arm-openbmc-linux-gnueabi-gcc (GCC) 9.2.0
>=20
> I need to run an errand this morning, but will replicate your precise=20=

> sequence a bit later today.
>=20
> I=E2=80=99m always open to the possibility that I=E2=80=99m doing some=
thing wrong or=20
> missing something, but last time I checked, -Os generates the smallest=
=20
> possible code and -s strips symbols.

Okay. Maybe :) Here are some results. The summary is that there's no
real benefit to -Ox for x > 0 for your test cases beyond a slight saving=

for the iostream case, because there's effectively no code to optimise.
Not stripped vs stripped contributes the biggest change as expected,
and it looks like your results are may not have been stripped.

$ ls -l *.O?*
-rwxr-xr-x 1 andrew andrew 12068 Sep 17 10:10 iostream.O0
-rwxr-xr-x 1 andrew andrew  5588 Sep 17 10:10 iostream.O0.stripped
-rwxr-xr-x 1 andrew andrew 11848 Sep 17 10:10 iostream.O1
-rwxr-xr-x 1 andrew andrew  5540 Sep 17 10:10 iostream.O1.stripped
-rwxr-xr-x 1 andrew andrew 11848 Sep 17 10:10 iostream.O2
-rwxr-xr-x 1 andrew andrew  5540 Sep 17 10:10 iostream.O2.stripped
-rwxr-xr-x 1 andrew andrew 11848 Sep 17 10:10 iostream.O3
-rwxr-xr-x 1 andrew andrew  5540 Sep 17 10:10 iostream.O3.stripped
-rwxr-xr-x 1 andrew andrew 11848 Sep 17 10:10 iostream.Os
-rwxr-xr-x 1 andrew andrew  5540 Sep 17 10:10 iostream.Os.stripped
-rwxr-xr-x 1 andrew andrew 11308 Sep 17 10:10 printf.O0
-rwxr-xr-x 1 andrew andrew  5528 Sep 17 10:10 printf.O0.stripped
-rwxr-xr-x 1 andrew andrew 11308 Sep 17 10:10 printf.O1
-rwxr-xr-x 1 andrew andrew  5528 Sep 17 10:10 printf.O1.stripped
-rwxr-xr-x 1 andrew andrew 11308 Sep 17 10:10 printf.O2
-rwxr-xr-x 1 andrew andrew  5528 Sep 17 10:10 printf.O2.stripped
-rwxr-xr-x 1 andrew andrew 11308 Sep 17 10:10 printf.O3
-rwxr-xr-x 1 andrew andrew  5528 Sep 17 10:10 printf.O3.stripped
-rwxr-xr-x 1 andrew andrew 11308 Sep 17 10:10 printf.Os
-rwxr-xr-x 1 andrew andrew  5528 Sep 17 10:10 printf.Os.stripped
-rwxr-xr-x 1 andrew andrew 11240 Sep 17 10:10 return.O0
-rwxr-xr-x 1 andrew andrew  5524 Sep 17 10:10 return.O0.stripped
-rwxr-xr-x 1 andrew andrew 11240 Sep 17 10:10 return.O1
-rwxr-xr-x 1 andrew andrew  5524 Sep 17 10:10 return.O1.stripped
-rwxr-xr-x 1 andrew andrew 11240 Sep 17 10:10 return.O2
-rwxr-xr-x 1 andrew andrew  5524 Sep 17 10:10 return.O2.stripped
-rwxr-xr-x 1 andrew andrew 11240 Sep 17 10:10 return.O3
-rwxr-xr-x 1 andrew andrew  5524 Sep 17 10:10 return.O3.stripped
-rwxr-xr-x 1 andrew andrew 11240 Sep 17 10:10 return.Os
-rwxr-xr-x 1 andrew andrew  5524 Sep 17 10:10 return.Os.stripped

These results were generated from a patch like:

From 9661cfd8a299d35c7a834720a537ade62e0637d2 Mon Sep 17 00:00:00 2001
From: Andrew Jeffery <andrew@aj.id.au>
Date: Tue, 17 Sep 2019 10:02:45 +0930
Subject: [PATCH] binsize

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 binsize.bb           | 28 ++++++++++++++++++++++++++++
 binsize/iostream.cpp |  8 ++++++++
 binsize/printf.c     |  8 ++++++++
 binsize/return.c     |  4 ++++
 4 files changed, 48 insertions(+)
 create mode 100644 binsize.bb
 create mode 100644 binsize/iostream.cpp
 create mode 100644 binsize/printf.c
 create mode 100644 binsize/return.c

diff --git a/binsize.bb b/binsize.bb
new file mode 100644
index 000000000000..9dafc74535f5
--- /dev/null
+++ b/binsize.bb
@@ -0,0 +1,28 @@
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://${IBMBASE}/COPYING.apache-2.0;md5=3D34400b=
68072d710fecd0a2940a0d1658"
+
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+SRC_URI =3D ""
+SRC_URI +=3D "file://return.c"
+SRC_URI +=3D "file://printf.c"
+SRC_URI +=3D "file://iostream.cpp"
+
+buildit () {
+	OUT=3D"${WORKDIR}/$1"
+	OPT=3D"$2"
+	make CFLAGS=3D-O${OPT} CXXFLAGS=3D-O${OPT} ${OUT}
+	cp ${OUT} ${OUT}.O${OPT}.stripped
+	mv ${OUT} ${OUT}.O${OPT}
+	arm-openbmc-linux-gnueabi-strip ${OUT}.O${OPT}.stripped
+}
+
+do_compile () {
+
+	for app in 'return' 'printf' 'iostream'
+	do
+		for O in 0 1 2 3 s
+		do
+			buildit "$app" $O
+		done
+	done
+}
diff --git a/binsize/iostream.cpp b/binsize/iostream.cpp
new file mode 100644
index 000000000000..2595edcd4953
--- /dev/null
+++ b/binsize/iostream.cpp
@@ -0,0 +1,8 @@
+#include <iostream>
+
+int main(int argc, const char *argv[])
+{
+	std::cout << argv[0] << "\n";
+
+	return 0;
+}
diff --git a/binsize/printf.c b/binsize/printf.c
new file mode 100644
index 000000000000..841a1460ae54
--- /dev/null
+++ b/binsize/printf.c
@@ -0,0 +1,8 @@
+#include <stdio.h>>
+
+int main(int argc, const char *argv[])
+{
+	printf("%s", argv[0]);
+
+	return 0;
+}
diff --git a/binsize/return.c b/binsize/return.c
new file mode 100644
index 000000000000..31dbf45bf99c
--- /dev/null
+++ b/binsize/return.c
@@ -0,0 +1,4 @@
+int main(void)
+{
+	return 0;
+}
--=20
2.20.1


