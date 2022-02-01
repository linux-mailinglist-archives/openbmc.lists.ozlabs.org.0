Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7224A5EC6
	for <lists+openbmc@lfdr.de>; Tue,  1 Feb 2022 16:01:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jp7Rp45Nrz3bZT
	for <lists+openbmc@lfdr.de>; Wed,  2 Feb 2022 02:01:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=I0J2IA5b;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=HoKyy8Vy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=I0J2IA5b; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=HoKyy8Vy; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jp7RH4Bzqz30L1
 for <openbmc@lists.ozlabs.org>; Wed,  2 Feb 2022 02:00:58 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id BE3C05802C4;
 Tue,  1 Feb 2022 10:00:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 01 Feb 2022 10:00:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=cc:content-transfer-encoding:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to;
 s=fm1; bh=rvqGCp+QIvn6CfhougJPAstmQfUfXhEH4jFdGziJD0k=; b=I0J2I
 A5bofAoG0881rnwpx8Ye2VwgtyvLYepCBxi5bJPbL6I/B+zUP/02E/nLGqHH1hlc
 PVOwdrW7NEG1425s9b5wdGSRZPU9/0WLUPTj2bGMqxhkumL28wwxiwEPedXYQxiQ
 WKu0fLbq7Iqp68YTJ5WntJauhxIbC3BwRXdZVOXQCPC6nmwnPGpO4Uef/cSjXubk
 Lbdd70G/uoBg4BVO9Baq4PlizDCgMPecGYtZ1ERz+os+nT7/iHkV7wme6FOBM2ON
 HT9CMC9Em9x66i8khsdiDDUo/3kzQPG3yn/cWFqhac9BBwqpGaXtqMb5aMH83aIF
 SteYfBifrA4JZgChQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=rvqGCp+QIvn6CfhougJPAstmQfUfXhEH4jFdGziJD0k=; b=HoKyy8Vy
 v0OojQkTafL5+fDQHJmu5dg8BRvAsXH/M/j9434zueQ+KIV0Eu1Hr8ISiZcQ0GCf
 c+VkZ66uEkBMUveh1/wopK6VVtKtI+w7VF7NPgJFGMAUBuxsEfnjZEo+s+j1rlw5
 QzG6n3Z3NOzSdQVw5UeOytcRhZZKidx4nallTtBXu7S9VakzizBNBG38EH05RYz9
 g3xmnW5R1kE4/avliIYqNjnw4OjO+h3zwVG8un7l9t022wVTrHkYGHJYQDFGylR4
 qHnxJNCUxJcWPBHIhaBzbydnEzIqS+xT1r7jEoaci9Z+C7RZC6HCMmCgwDTY69Z3
 f7lTaz+ohwPHog==
X-ME-Sender: <xms:JEv5YSDOiXo3NPef27RKdkUjIT0iidSg5oJhgaOBkt3_lTqyrzDoyA>
 <xme:JEv5YcifUwlKcfc6xkhCGN4PLsiPl_YXPDpKyw6zOBcruQduIn9N-csgNeswid3KS
 Y5UNWVNPptjJ_tZI7A>
X-ME-Received: <xmr:JEv5YVkQ6c2fSZztYD9ypQiPVM9V6UfB3WbwhMz-VhosfYH-JG03iAUYSPq5uANN7p7aZ36lfIVoQQZEcg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeefgdejtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtfggggfesthekre
 dttderjeenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhu
 iiiiihgvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpeduvdevhefhvd
 fgvdehieekleeigfdugeeltdffvedvueeiffejudduffdufeeiheenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsgesfhhuii
 iiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:JEv5YQxY25XPGDyZEJbAeNj5wZsSl9O7Zn9WFjpdZgXtaD0DAT0cFQ>
 <xmx:JEv5YXQJ065gOLcEwtJQpIH59oX69dq3ZwKq-FE-CFYZJBTWBqQtaA>
 <xmx:JEv5YbbaL9qe1ZklzCiCFnaHiWNxT93pNwHuiDpCeW82np2tSQweQA>
 <xmx:Jkv5Yc-T5kWEJrRZtPu0drMCQpZDZXq1BMMdod9d8eA8hVlhrojHhw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Feb 2022 10:00:51 -0500 (EST)
Message-ID: <bb7d42825b64af348b000b158fd551c1964c44b9.camel@fuzziesquirrel.com>
Subject: Re: removal of company specific, general-developers teams
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 01 Feb 2022 10:00:51 -0500
In-Reply-To: <20220104182619.ua6xl655s72d44wu@cheese.fuzziesquirrel.com>
References: <20220104182619.ua6xl655s72d44wu@cheese.fuzziesquirrel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Tue, 2022-01-04 at 13:26 -0500, Brad Bishop wrote:
> 
> If you are aware of any use of these github teams please let me know. 
> If I have not heard anything by February I will assume the groups are 
> unused and delete them.

Hi all, I did this just now.  If you notice any problems, please reply
and we'll come up with something.

Thanks!

-brad
