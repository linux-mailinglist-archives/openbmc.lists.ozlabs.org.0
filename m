Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3328373580D
	for <lists+openbmc@lfdr.de>; Mon, 19 Jun 2023 15:09:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=hwxjjW1f;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=CDhB1FJA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ql98X6m2kz30dw
	for <lists+openbmc@lfdr.de>; Mon, 19 Jun 2023 23:09:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=hwxjjW1f;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=CDhB1FJA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=lists.ozlabs.org)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ql97r1YnPz304l
	for <openbmc@lists.ozlabs.org>; Mon, 19 Jun 2023 23:08:55 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 59063320095B;
	Mon, 19 Jun 2023 09:08:50 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Mon, 19 Jun 2023 09:08:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1687180129; x=1687266529; bh=JK
	YAL/Zrmo/17R1QgLoR1t8DL6oMFtqmdDwkknkmEJY=; b=hwxjjW1flojF5ETQ0C
	37drr5CtpUdVkh54IpInn054Wtq1vWlbaTJqpC3+MEXzxyfMDtmlzXMl1an1mgRJ
	JLWFaBMEgKPimtSHxWPzjkamIH0k3Scs7Rp+JQscNdsSfq/AxCE1fFZ+g3qDrrks
	//EuEawwlSuG9u2OsIOVms8401obrQFb0Fq+oV3e/tp33uO1FzuIM0qrH2PaEuAb
	NCBSEW3e8+TCALkb7GLNYlAqz0C/5BihlfNbeNjJHxv91a07Vuh8kgh7mCv8UC62
	7b9vD7OyaNvVmysWZPJA3rJSAVNxhMZsnupJhTaZekn8G/eRUcwYzqafu5WzH+/V
	ovGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1687180129; x=1687266529; bh=JKYAL/Zrmo/17
	R1QgLoR1t8DL6oMFtqmdDwkknkmEJY=; b=CDhB1FJAwdl3UmfE06eoT95JMJSzy
	6/ZsyE3xZ74zkmFguZm3GlvmUwLgFIVV2i3A1rJiv/ROvw90ZHJ1RaZEadj1HvMh
	FpjGDxZ62SONeuM0UHqCVksjpCiyJyLPLHTxWl09lWTHYbipriWfC08xd5KiCq3g
	7iwzFEuL1uk5GsZ/DKxKpXnqV7zZpF579Y8lfaEtmoACG5JFQynl4LKZTeAVG7by
	QtnTrsySgRRXJhSeAT33oc0ZDPjWvHiGJ1sd++jmYdxuIhNYWTGFSKnnaGO89ED8
	Wn/JW7Pa0LLParnwhhosOr22rBm6QT0GEEm4nLzGMzaaoQkMYXRjb4jew==
X-ME-Sender: <xms:YFOQZIwsufvbrhWeTRXElTVvuLoH-5BAFYVV1qwzE1vFT7tMuCVrxg>
    <xme:YFOQZMTb40yfpXSQ60jokQNuKrpnzat3NYkAfbG6cqOORVp0O4rfSgYSqhqs5H9Be
    5wPWVRgPlXCgzYQFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeefvddgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeevtdejgeejieffgeekgfdugeelkeevkeegkeejjefgleejkedvjeff
    ueevteffgfenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhsuhgsphhrohhjvggtth
    dqmhgrihhnthgrihhnvghrshhhihhprdhmugdpohhpvghnsghmtgdrohhrghdptghomhhm
    uhhnihhthidqmhgvmhgsvghrshhhihhprdhmugenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:YFOQZKUCh_wFXTfuwmiZstI7v2YRYCToQE3NCBOEO1aC6FA_2QCZ2A>
    <xmx:YFOQZGjK25xo2DqNRxEPlX1Bly147UocJ6gt-0F21oPAl_Gy-hrbzA>
    <xmx:YFOQZKBikkUTAWh4Jv-a7yvitxSDFyhYn-prkvRTr2LMG1e1mzXtxg>
    <xmx:YVOQZL66aq_lXqijBuvnzXndeze7m6-eTiKS1uqEjA1hwV3AR9WLfA>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 78A291700090; Mon, 19 Jun 2023 09:08:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-496-g8c46984af0-fm-20230615.001-g8c46984a
Mime-Version: 1.0
Message-Id: <e998fac9-25c2-4b20-96c0-9968ad10c4f5@app.fastmail.com>
In-Reply-To: <fdbd70b3-e85a-5756-b12f-9a291fe7767b@linux.intel.com>
References: <f21a5062-b462-4597-8770-4869b0071ba2@app.fastmail.com>
 <fdbd70b3-e85a-5756-b12f-9a291fe7767b@linux.intel.com>
Date: Mon, 19 Jun 2023 22:38:05 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Suryakanth Sekar" <suryakanth.sekar@linux.intel.com>,
 wangkuiying.wky@alibaba-inc.com, openbmc@lists.ozlabs.org
Subject: Re: openbmc/bios-settings-mgr: Notification of unresponsiveness
Content-Type: text/plain
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

Hi Suryakanth,

On Sat, 17 Jun 2023, at 00:06, Sekar, Suryakanth wrote:
> Hi Andrew,
>
> I didn't see any open code review waiting for review and merge. 
> Everything is taken care.

Yes, thanks. If you look at the history of the patch I linked in the original email, you'll find that Kuiying merged the change approximately 4.5 hours after I sent the notice.

Andrew

>
> Thanks
>
> Suryakanth.S
>
> On 6/16/2023 10:26 AM, Andrew Jeffery wrote:
>> Hello Kuiying and Suryakanth,
>>
>> A complaint has been raised to the Technical Oversight Forum that one or more patches to openbmc/bios-settings-mgr have not been responded to in a reasonable timeframe.
>>
>> This is the first notice of a complaint of unresponsiveness.
>>
>> The project has recently defined some constraints on timeliness for reviews. This helps to set expectations for both contributors and maintainers. Maintainers are expected to find time to provide feedback on patches inside one month of them being pushed to Gerrit. Upon complaint, missing this deadline forms one count of unresponsiveness. If a subproject's maintainers receive three notices of unresponsiveness within a 12 month period then the Technical Oversight Forum will seek to introduce new maintainers to the subproject.
>>
>> Further details and considerations of this policy can be found at the following location:
>>
>> https://github.com/openbmc/docs/blob/master/process/subproject-maintainership.md
>>
>> The complaint regarding openbmc/bios-settings-mgr can be found below:
>>
>> https://github.com/openbmc/technical-oversight-forum/issues/27#issuecomment-1589985292
>>
>> The specific patches identified by the complaint are:
>>
>> 1. 63276: clang-format: copy latest and re-format
>>     https://gerrit.openbmc.org/c/openbmc/bios-settings-mgr/+/63276
>>
>> If you are unable to continue with your maintenance role for openbmc/bios-settings-mgr then please work with the community identify others who are capable and willing. Please consider the expectations set out in the community membership documentation as part of this effort:
>>
>> https://github.com/openbmc/docs/blob/master/community-membership.md
>>
>> On behalf of the Technical Oversight Forum,
>>
>> Andrew
