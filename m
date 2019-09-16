Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C43F3B33DA
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 06:17:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46WtHF1B1vzF4pB
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 14:16:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ESMoxTDX"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Pjph4bQZ"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46WtGK6FzZzF1fx
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 14:16:08 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4F15C22023;
 Sun, 15 Sep 2019 23:45:18 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 15 Sep 2019 23:45:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm3; bh=Z3tZX
 Bhl9neT+yl+KaBmNVj4BceX64jCzX3XiLjmRw8=; b=ESMoxTDXCvjNqaiEM+a8e
 HrfNSvymp3nKYv3mcVflq4yKk5j45peCEqPDjiYkz+Ia7xElAsuYpzsywzcZBMaU
 jfkhGVZIvS232qDilknWGsvRb1QUGgiLVGin7U7Jm+64KO4Dixl9dxoitM4HlSms
 pGGmHitYpdw+jMBZCAmkxDhbrrFFdAzSRK96do1svv8tD+709Iqk6eC2qQa8bIW3
 RaGAQXQZaGj5hSFRjZe9KWci4QO3bLlyKQgCc1xozKJN0gXtzZOnTDUqhNQ5hQU6
 Z0bI2HO3tekDaczHb4GrUzhU2X/uys3FYEPI7IX0X2tSNpxY9XSSbsxsbRcMOkLL
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=Z3tZXBhl9neT+yl+KaBmNVj4BceX64jCzX3XiLjmR
 w8=; b=Pjph4bQZZzD/v8WYGhWB1A09T/DtduWG/tnvtGi3vpytVXaE6ycKGSnty
 QchbciKfusjNNcJHZdJe/6AeH2gXBp8dZ3HDqi0XwBMwDVgA+PtF70DQ5kmcDxoJ
 CnkQbX/Hn1psFC/KnjYbMY5sdg24S6MtaOu5B2pnvFaWWaHnrSgW3p7k3BNu9gvz
 dv6yIqDUXpoezeOrhyZI+7OeyFCame+yGLf5oNhVhMadVZ85CgDoqVySXvXqoQbA
 A5isCPxY0zNnnfM77cjPT6Ne8KN1ML9CC/e9JxWzbtApDcFUDz/VCuAJnXGUVPVb
 FZdqy43s1Lp3nYsnLnyBpEsZoDxZw==
X-ME-Sender: <xms:SwV_XdRjqPOF88jvS2zpRs7jey1PbcVWzsLdxqajTIo7ST4MDQV02w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddvgdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:SwV_XRf_f8Y6acm4QZarDQbOqtQWENiExDIr6G2O4x6b8k5o8C27FQ>
 <xmx:SwV_XbgQZEx9VHw48mKySuS8NJZDsmO03ffskwynZnucfD2hOpNJgA>
 <xmx:SwV_XcIQNiFKB4w--t9UoVBevbPhBm0mdOzeR5vyj6Oja4dVGq39QA>
 <xmx:TgV_XeyO_4hRhthqZOLcvkUU463GP8_cZxdYQs9upaOy0aikM2_isA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 983E1E00AC; Sun, 15 Sep 2019 23:45:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-237-gf35468d-fmstable-20190912v1
Mime-Version: 1.0
Message-Id: <abc66266-d93b-4464-a720-2829bf663e08@www.fastmail.com>
In-Reply-To: <B01C7B99-DEFC-4252-A402-38903C016238@fb.com>
References: <B01C7B99-DEFC-4252-A402-38903C016238@fb.com>
Date: Mon, 16 Sep 2019 13:15:50 +0930
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

On Fri, 13 Sep 2019, at 22:22, Wilfred Smith wrote:
> These values may be of use to someone else. I=E2=80=99ve been putting =
energy=20
> into reducing code size lately. The following are all with -Os enabled=
.
>=20
> Smallest .SO (one function with no statements in the body) - 8.2K
> Smallest executable (main with only a return statement) - 12K
> Smallest executable with a printf and return - 14K
> Smallest executable with a std::cout and return - 103K

Out of curiosity, how are you generating these results? For instance usi=
ng
the Ubuntu ARM GCC cross compiler I have a smallest executable of less
than half the size of what you list above:

$ arm-linux-gnueabi-gcc --version
arm-linux-gnueabi-gcc (Ubuntu/Linaro 8.3.0-6ubuntu1) 8.3.0
Copyright (C) 2018 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is =
NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPO=
SE.

$ cat empty.c
int main(void)
{
        return 0;
}
$ make empty CC=3Darm-linux-gnueabi-gcc CFLAGS=3D-Os && arm-linux-gnueab=
i-strip empty && ls -l empty
arm-linux-gnueabi-gcc -Os  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-neede=
d  empty.c   -o empty
-rwxr-xr-x 1 andrew andrew 5544 Sep 16 13:08 empty
$ size empty
   text    data     bss     dec     hex filename
    759     276       4    1039     40f empty

Admittedly it's not the SDK cross-compiler, but some more clarity
on how you came to those numbers would be helpful.

Andrew
