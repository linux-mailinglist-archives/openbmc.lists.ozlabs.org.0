Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A41AB63C3D3
	for <lists+openbmc@lfdr.de>; Tue, 29 Nov 2022 16:32:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NM5tj5vp5z3bTm
	for <lists+openbmc@lfdr.de>; Wed, 30 Nov 2022 02:32:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=bsgf14sN;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=A+rZL4r8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=bsgf14sN;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=A+rZL4r8;
	dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NM5t25v8Jz2xfS
	for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2022 02:31:54 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id CFCBB5C00E6;
	Tue, 29 Nov 2022 10:31:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 29 Nov 2022 10:31:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:content-transfer-encoding:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1669735910; x=1669822310; bh=K/zIi3IWuDxulMrSgnvG+Jd0P
	cc6EnYw2RVqYMMI21o=; b=bsgf14sNDjxwW8Yiz+/v+avv4DSg/E4fIE1ZOVQvC
	2C0lTzd0ctd8mMgdOBxPOStNk45hGRWYDxeWdIQEyF3phcVE7Yv3tDYx7htEwyb/
	D6XrBKMcP31fijVX8e6924GkH+UGSNaR8vlUMiP962Q0RARY+Dez8t6YkLPjJmJk
	7QmAyNRcJcVfsWQfd13D6Ths0+mUpqr5E05izoed79tegxGAyKAExsL8DCG/Hv9R
	6Z5NuAlOAwnyzMl0ZTyp0jDzSN9Nrh8eMHWFW/RtHt46Ls0pbZ9p3XcoL3oaYjxR
	1WnM4aN85mmLnpuDsj4Cox256CgDW+eyDfJcbC3iFuFMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1669735910; x=1669822310; bh=K
	/zIi3IWuDxulMrSgnvG+Jd0Pcc6EnYw2RVqYMMI21o=; b=A+rZL4r8hmImHEI0Y
	koDHMfs8acA5Pv2/NtQnKInDp94pK1gg/fJDpjIv871ENpNfzg/QTi2ciGGk54+A
	EqkLKsT4M0zFWUYEYy4Jjb4DvW2bDoysTzhzqCIJGgR4iRgW1HZbLMMdt3D1l2I/
	PZHzyMRE0LQ+Zzg5Y14rqULq0DD0REyvKfOZgwSr/wshBHehtDDzYjdAmj0mTiSz
	Hjd2O/sI2G5t5Wkd3Mow8N0daeWJIW3vcUD17ZORS+ePwdiCFAu8yNJNsX9poF2K
	/U4coEhr8lffzkQnTtiH+DNTW8fKOe9psfkk910l++dHS8atJLFruAFOO4NDH7VA
	zxnSg==
X-ME-Sender: <xms:4CWGYxfzMOvVttE5zH-dq3e9YohS1akSmwKJvljC42kWmjvIIXQdGQ>
    <xme:4CWGY_NGaHG-LmLAThaJmLtv0JVAddaOjw3Fr0KYCM8QS1YmeQOwbj-1DpB3f9jUr
    -7iCzqg83Z7LEvw_7U>
X-ME-Received: <xmr:4CWGY6jfiBLbwN9bndX3cVmH5GoUAVe9xlLQTuH9FwTqbrvDvjm1PGRkViAPTx_xh1qVExeeq1Eh7jfmmoCD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtddtgdegiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeeurhgrugcu
    uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
    eqnecuggftrfgrthhtvghrnhepfeehffekkeeggeevgfffhfekfeegveefvedugffhudek
    veduuefhjeeklefhieefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:4SWGY6-W-wClNPE-JmEhE9n-JDbFgnerVURa0i-nfBEMNjS4pfURIA>
    <xmx:4SWGY9smGFy0A9nkQxs2Y6mndPUZ8uVdTVqkIFyQlO8gSTdtFil3Ow>
    <xmx:4SWGY5Hp-yWyz2mSBIIe_uR0q9qlJZ8rBT86nBch41cUmCxBsrjHLA>
    <xmx:5iWGY71JIzr8uv_dWiZ3PYR1z-PidPwp4Qk2SK03tYNjFq0ACQHX9w>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Nov 2022 10:31:44 -0500 (EST)
Message-ID: <22901d25c965d23458ac7bec69529fdc7eb20043.camel@fuzziesquirrel.com>
Subject: Re: Ampere's CCLA Schedule A update 2022-11-21
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Thang Nguyen OS <thang@amperemail.onmicrosoft.com>, 
	"openbmc@lists.ozlabs.org"
	 <openbmc@lists.ozlabs.org>
Date: Tue, 29 Nov 2022 10:31:43 -0500
In-Reply-To: <600E431F-0F36-4253-9293-9626C2C9B9E2@amperemail.onmicrosoft.com>
References: 	<600E431F-0F36-4253-9293-9626C2C9B9E2@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 
MIME-Version: 1.0
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

On Mon, 2022-11-21 at 10:19 +0000, Thang Nguyen OS wrote:
> Hi Brad,
> Attachment is the updated schedule A of CCLA from Ampere.
> Please help review.

Sched A updated.  Apologies for the delay!

thx,
Brad
