Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B377A8CC7
	for <lists+openbmc@lfdr.de>; Wed, 20 Sep 2023 21:28:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=btJGaUpJ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=BkLHPtzp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrT8p3Hkqz3cLV
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 05:28:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=btJGaUpJ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=BkLHPtzp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=lists.ozlabs.org)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrT8733W0z2ytV
	for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2023 05:27:50 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id E6A515C0164
	for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2023 15:27:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 20 Sep 2023 15:27:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:resent-date
	:resent-from:resent-message-id:resent-to:sender:subject:subject
	:to:to; s=fm3; t=1695238066; x=1695324466; bh=OEUqgykOcU7FjrN5JI
	kqcPLYueTfIv8Ghd/anXbwQ0w=; b=btJGaUpJ5Byl13fChTDsoXSeZasUbvGb+f
	pcZh9f7HYLDk40PPi0z+HrO0aMh72D6/Qw7Ay88dt8O2a8cemRMzIJbiKNrSFGFm
	+tzV0EHnBGU5EVyyaQX2LoWRjC35lFuVI3aW9+QFGUl/typMiY2TjoRuN0L424mz
	yUT6j9qePkfskgd8caxuELrT5zGwGVPYOTeq3yRFkeNiQjc8hxK2ZPktmo/2Al5n
	aMiqTi919zrXuow6UByDMw4a+3SdXk4OXJug8XbazCHYPSB8UCCDgA26QQvNSk8L
	LiQE7hPyIERT6xOrgzadHHJdyd1WYKOCY8HssmGcZ74uRwgRGHOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:resent-date:resent-from:resent-message-id:resent-to
	:sender:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1695238066; x=1695324466; bh=O
	EUqgykOcU7FjrN5JIkqcPLYueTfIv8Ghd/anXbwQ0w=; b=BkLHPtzpkUW4b70UZ
	XFaRdk/F8iy8zCRA1sKaI4Fr9PzKqTHfrguyQaZu6w9GyPhZDWStUxHt5PdB0mI7
	ZfFEkoIt90mIg+8bzCFLG8FCKClwi85jY1ZBM3SrEfuSJtyTS8BlZAbKgLrudvAl
	vcwNbWPojdim+Lwv4AQakVpKSKpVh2OJumoPyA3TEe+uaELRbiF36TZCL79OWbRp
	qFxix7Fa/eEUBqys30sh5nA7AbotHFbqb/N/3iNILtIFW1ljPkrfXVgFJjY4FUci
	DltDIQDLcmh+ZzdvCJuU0NP8lIAO3Ft8uv0Flt3GxaLT3TrxCUi7hWbb6e3axTmP
	Uo0YQ==
X-ME-Sender: <xms:skcLZXkmet0KzBfPjLLDQpjy_wBdtDuwKM4fbU1tmpOghb4SweO4pA>
    <xme:skcLZa0zFbkzQ8hvLHnSBKxBLci4XKePIBFwa9G1nhshWXEppshVe2m1jKcokGU9E
    9z5mVMfBhtUoW2-J1Q>
X-ME-Received: <xmr:skcLZdrGUHuw7ypm_J_UGzkNYSK02G0hoF7AvoPtxfZRX67_gAolGyXmEBmGSNbQ-oFwx7LwVvTCprEKkRwq-MRAnAgTu_kZeb9cPsOMYPnrhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudekfedgudeflecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggugfgjsehtkefstddttddunecuhfhrohhmpeeurhgr
    ugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
    homheqnecuggftrfgrthhtvghrnhepkeehvdekgfeijefhfeffvdetgeeiledtfffhvdet
    vdeuiefhgeduudeujefhudefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlh
    hushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgih
    sgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:skcLZfny57V30fsENDFUwrHffHyh6Uzcju23xI5mPWYmYBeivQPUJQ>
    <xmx:skcLZV3u3f88Fqj1sg_fqc9T2FAs7YsTvVC4VjqqB--In4mLv7hVpQ>
    <xmx:skcLZeunSDqADBBwjU3j9pCf2-m_Lf12V_R8pfiOcthO0bjKj8woUQ>
    <xmx:skcLZShPmWGuDQFHT-Nk1vAgc5d2Erlo_sbb_pLsYVat1xYVXXMj4Q>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2023 15:27:46 -0400 (EDT)
Resent-From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Resent-Date: Wed, 20 Sep 2023 15:27:45 -0400
Resent-Message-ID: <43ddybus4hb3oc3lek5ccysylk3txm6cxsnegwuqk6462qhp5e@n3kdmrhoeduw>
Resent-To: openbmc@lists.ozlabs.org
Date: Wed, 20 Sep 2023 15:27:04 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Towards less magic strings.
Message-ID: <sf6heopbdkrvxjeehuz5qaykdx3lg6bmbqusw7u677pia7sucz@jha5vfrslwln>
References: <ZQKp6bcE3rvXsTIF@heinlein.vulture-banana.ts.net>
 <aaecc12856e6ba3ef92e6927bb1ad7360281098d.camel@fuzziesquirrel.com>
 <ZQQiAqjj--miyo_v@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZQQiAqjj--miyo_v@heinlein.vulture-banana.ts.net>
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

On Fri, Sep 15, 2023 at 04:21:06AM -0500, Patrick Williams wrote:
>On Thu, Sep 14, 2023 at 10:26:37AM -0400, Brad Bishop wrote:
>> On Thu, 2023-09-14 at 01:36 -0500, Patrick Williams wrote:
>> > When I look at these, the vast majority of them falls into 1 of 4
>> > different reasons:
>> >     - A well-known service name.
>> >     - A well-known path (or path prefix).
>> >     - An interface name.
>
>As a concrete example of what I'd like to see improved is this verbiage
>embedded in the YAML description:
>
>    https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/Sensor/Value.interface.yaml#L3
>
>> In my mind these are not magic strings.  These are parts of an API.  We
>> don't get annoyed by having to hardcode c++ function names when we call
>> them - why do we get annoyed by having to hardcode DBus names?
>
>They may be parts of the API, but we document the API in PDI, agreed?

Agree for the most part.  Some interfaces aren't documented there, for 
one reason or another.

>
>The big difference between C++ function names is that the compiler tells
>us when we messed those up (and your editor can do completion on them if
>you've set it up).  With these strings, we're relying on humans and
>runtime-detection to ensure we've got it correct.

Yeah makes sense.  The build time assurances are usually nice (although 
I have been in situations where I did not want every component to fail 
to build just because of a D-Bus interface change).

>Often we get it
>wrong.  It has also been challenging to refactor dbus interfaces, again,
>because we don't get compile-time assurance of correctness.
