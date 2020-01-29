Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A013414D088
	for <lists+openbmc@lfdr.de>; Wed, 29 Jan 2020 19:31:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487BsC16pMzDqTJ
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 05:31:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.27;
 helo=wnew2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=XA6QvyuD; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=cF35u8JE; 
 dkim-atps=neutral
X-Greylist: delayed 483 seconds by postgrey-1.36 at bilbo;
 Thu, 30 Jan 2020 05:31:03 AEDT
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487BrR4XQ4zDqQC
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jan 2020 05:31:03 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 36C846A6
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jan 2020 13:22:56 -0500 (EST)
Received: from imap21 ([10.202.2.71])
 by compute2.internal (MEProxy); Wed, 29 Jan 2020 13:22:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 mime-version:message-id:date:from:to:subject:content-type; s=
 fm1; bh=4ug6ydH1mh/RofW+uG6Tvmt1+riPwc20zXxURFDVmbk=; b=XA6QvyuD
 efz55Ke0tt0FoZ2m8EGXhsAa1fsaxvl7fGsnIS0l3DQrt8NI1szX+H7x8BbCfNRB
 dKnYjrlI4YtMoaB7vC4RWJicy7q36V/9I1Dgafx1ETyrduFB1LyG1Bb1x8ZMh1UN
 +00pz3hDjHZq/oC3iYjuKMnRyzBsDGh88x4rHqyiaJVWo4dwluLLbZq40qsvU2Df
 Y1cmRWL/wEqlOIvVm9WkJGyuVo1hVmtZAcYHF6ve+9KDJbRITlSS9zAXYstbaQOF
 n5mP4rcUn+dp+4mtho6AYJJkJ2U04+H3+m7ZXm6o4IuGkN9aTWUfjQ/4uWn00k2h
 its/7gqc5wrK7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=4ug6ydH1mh/RofW+uG6Tvmt1+riPw
 c20zXxURFDVmbk=; b=cF35u8JEvyEs1aYLbM14kl9+2pvt3ARhDNI6heJfGYsEJ
 fqdmRvp0hTmXRCzfTMeKTI21oAZGuV8VaNVyMGJzdHnN6261Vvn5XXikI52y1sFj
 YTACYlwrmeVo+FjBVHhitJecRQhErUN8R2/Vj8Bz75EOhz0WhWBr3etfpgn4GUVU
 VzORBHcJ+FktJ7GIW26X57VZQJc3MSP4oU17G1gfGwQhSJXXwZWpu6Ios7LiNU8y
 gRG/eMLPgsaMhmivwf3YdeV5xzsOWIyKIllh63rLsh2ceoH63TInVaxcKbOj38yU
 e9zO5l+Wm/BYQxKosdoq+rsBaZ8/zl3i0Xd7wSFvw==
X-ME-Sender: <xms:f80xXmIyE0TV1R1KjCV1Vmd8gy_qBagWfeD5RT6PP9D_VStbyFaKjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfeeigdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpefofg
 ggpffkfffhvffutgesrgdtreerreertdenucfhrhhomhepfdfrrghtrhhitghkucghihhl
 lhhirghmshdfuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigt
 gidrgiihii
X-ME-Proxy: <xmx:f80xXrSVPbSm8tZCFCDTtZLDKyty5dKA_-5LcM21N7_aILJ90CZcTw>
 <xmx:f80xXnJdGcvxNTkTeKkyD62z1iQz9aOUF2f4LWB0gBYKKYbQKcp02w>
 <xmx:f80xXsa2suAZXIyvuaorzkgWrie9t2CiNelfGFVyXltWuo371g6-yA>
 <xmx:f80xXvVJw7BJ6Ps3yE8ZGF8RYpTqhbsT312wmYR7GyF8kNBsOilcYsksCro6iOfk>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 04C48660069; Wed, 29 Jan 2020 13:22:54 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-781-gfc16016-fmstable-20200127v1
Mime-Version: 1.0
Message-Id: <23247186-abaa-4f7d-88fb-38f871c745e8@www.fastmail.com>
Date: Wed, 29 Jan 2020 10:22:34 -0800
From: "Patrick Williams" <patrick@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: Test email - ignore
Content-Type: multipart/alternative; boundary=e636fd1f8e594dff829065bc6e6c3a2a
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

--e636fd1f8e594dff829065bc6e6c3a2a
Content-Type: text/plain

I seem to be having trouble getting mails to the mailing list. Sorry for the noise.
--e636fd1f8e594dff829065bc6e6c3a2a
Content-Type: text/html

<!DOCTYPE html><html><head><title></title><style type="text/css">p.MsoNormal,p.MsoNoSpacing{margin:0}</style></head><body><div>I seem to be having trouble getting mails to the mailing list.&nbsp; Sorry for the noise.</div></body></html>
--e636fd1f8e594dff829065bc6e6c3a2a--
