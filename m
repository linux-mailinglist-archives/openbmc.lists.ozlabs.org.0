Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A053B6948
	for <lists+openbmc@lfdr.de>; Mon, 28 Jun 2021 21:46:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDJ565YK6z30Gt
	for <lists+openbmc@lfdr.de>; Tue, 29 Jun 2021 05:46:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=cBuPwKPy;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=SD149PlY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=cBuPwKPy; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=SD149PlY; 
 dkim-atps=neutral
X-Greylist: delayed 419 seconds by postgrey-1.36 at boromir;
 Tue, 29 Jun 2021 05:46:01 AEST
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDJ4n0sBmz306c
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jun 2021 05:46:00 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 42F335C018B;
 Mon, 28 Jun 2021 15:38:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 28 Jun 2021 15:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :mime-version:content-type; s=fm2; bh=v+geP2H7ku5+XpFrqSTXV4DyTR
 UZAH2Fez88myzrZ7Y=; b=cBuPwKPy7lLKYDC/bTuNEkA5lRlt8vsbSREIiHVvsE
 zknJfBpcApVKn6YgbbK8P50v2zmdTPTd5bFDpnZdri+OGiR8O2FJIDax1LKChxHm
 S7rv75zak9CqLl+OO3jmUEOgwfnX52Ktl3sTYg9lWzSdLhljXRKSxLyiZ38X4Hnh
 RLCoXQYQluTepH0Ahw5USLnsryhKvfJzVkUhZ4F/3eeCl8i34M1i2NCCunAbR+4c
 7JXqMwCvs0/I9dbXPjP5y89vKR3eK6OHcROcv0zoxxxuzpucCah93ARNiYg9bq5y
 sDmMoUaSGfLjva5/8/n/NIGjp86QzwqjIibnB714MqVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=v+geP2H7ku5+XpFrqSTXV4DyTRUZA
 H2Fez88myzrZ7Y=; b=SD149PlYaKGDmUeC031iRRCGBwi7mifIx58hV751F3h0/
 NWCAY8sfdHbfr+GCpsjYsbdsZroksXPA4hChhNYqSfWeaoFZsB3aw2bEgZwe5bFR
 0xA5WHy+XVGzS3mXqaXW0Fxkh+FryDy6Pk9oWXjxCTcBzeA0HqxUVFiCa3s0bk7K
 PN1GN/eXZbMH0y9NmhU3ZEmSZwedU9IqT8MqAn27NVUs3602bojfDuLSWu7P8Gwl
 dxxWd0QpN249K12Um8lbkwuzondQr6bxT5DZqHEHhI+IHk3H4ArCRp9h0aEA12bn
 N+EFRQHSOdI04qqYUTbmPRF/6r1cuLbDxUL6cQ4aw==
X-ME-Sender: <xms:TCXaYGcFrK_zMYDEmm-OT_l9yLFdiecwdLxrUNTstW0vvmQ9jzz9oA>
 <xme:TCXaYAPzAu6x8WpZ9fiov-BoG8QacZH8ZLZaBL1_TCOV2Ps-iPD_PMd-zOwntKzTA
 Uk39WmE30Lt-OHOwX0>
X-ME-Received: <xmr:TCXaYHiCupWMkE2Hp-usy2tTC-_s2wxE5H1mj-ogLKNKGuImXFkFByhX8vHTC3U01BtIaBHh5UuekRU0neeQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehgedgudefkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfggtggusehttdertddttddv
 necuhfhrohhmpeeurhgrugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivg
 hsqhhuihhrrhgvlhdrtghomheqnecuggftrfgrthhtvghrnhepvdeludeugeevgeekueei
 hfekheelvdejheffffeukeehtdffgedvvedvgedvhfefnecuffhomhgrihhnpehophgvnh
 gsmhgtqdhprhhojhgvtghtrdighiiinecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlh
 drtghomh
X-ME-Proxy: <xmx:TCXaYD_JJO3edJjCN4VU2w51P3MqHoTQiJRpN_JlJxxtB7QN_x37hQ>
 <xmx:TCXaYCsO0GnMLTWMTyTteh7wWWP8jurDBn2rmn8lPt_KR9AEMGiWUQ>
 <xmx:TCXaYKFG29SmnERgw4TB0JplGe-aLezS4pgiL0SAxz3zG81xPAMOlA>
 <xmx:TSXaYELo9tSV_JnfJ9bkrarYQanjQ8OmlWPm7HVqPWs5aonYSxcTnQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Jun 2021 15:38:52 -0400 (EDT)
Date: Mon, 28 Jun 2021 15:38:50 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Subject: Inclusive Naming
Message-ID: <20210628193850.gylhta7melpevjju@thinkpad.fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
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
Cc: Samer El-Haj-Mahmoud <Samer.El-Haj-Mahmoud@arm.com>,
 Sagar Dharia <Sagar.Dharia@microsoft.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi everyone

I would like to highlight this addition to our documentation:

https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/44522

Please review, and if you have any questions or concerns please voice 
them in the gerrit review, or you can simply reply to this note.  Your
TSC intends to wait a few weeks for feedback, evaluate whatever feedback 
is received, and go from there.

Thanks

-brad
