Return-Path: <openbmc+bounces-1313-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Od3BEArgWkwEgMAu9opvQ
	(envelope-from <openbmc+bounces-1313-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Mon, 02 Feb 2026 23:54:56 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D59AD285A
	for <lists+openbmc@lfdr.de>; Mon, 02 Feb 2026 23:54:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4hkV0P7Rz3bf8;
	Tue, 03 Feb 2026 09:54:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770031180;
	cv=none; b=R6+y+FJ7UV+7vQX6M9BGE4puI01jV9ihVrFZa3UBffNyLFag2WMI+UF+j4S0Zo69F0xK+irbnw3OZQmjVhtDXrGoY8cs8diHwpr2IYYKAMWzmG5CLwwLoN2iHGaVdXNnQAN8jo54Hg8KOK3SimGVC0DAeb0JpIQny+Lc+Oi8mOmc30pvLccPeWpm5ZWLb4enBAH+uJIPyQ9vG6fv3pM/nT08bU83zAgYOoXgF3P71CA3IDGovQ0c6YGaEmtMJgCrbE5nQBzhdhgCol1Ci2yO/+5nXKwDjCBTAd0Hrv/oPqQU5t3rG+/ef0yFzaHjPk7SMK1aspiaiPc8/YP0Wlc/4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770031180; c=relaxed/relaxed;
	bh=vkH3uyDe1IYJlfN4Vrhf9/CvNIbaIvxv6mm2y5l5B9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ot/zzB59G2RnhOsU9zxYE7V+l8szFPx/6Bv1w301HuKKqgUocGcEaZ460A8bo/XhQw0oNVxGsoqKUn1NJ3RUrkGDPFK3UtRzWcCZ55nFeq2UyZbqZbcydEPbYJA8vv3VeRw730RkX2GD9wk7GJGOisSuGPL69Y+LKf2N0GTbmdwWNQvBNYbCHDvEXVfwIi4g7UjADNygd8191inaiVv0NNDCVYLdcE/0Qr53TmGaaiUnJJAHJzuvJzOk6/pyvs7c1A1092zz9OmPPLO138e6eJXnK119F8XQIGiUD6P5j7YhgUYQqWIgJibmwjsMyQuHF/trf1awoTJf7vtZJpE52w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=fIEV1KvD; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=christopher.meis@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=fIEV1KvD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=christopher.meis@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4PK70N3Xz2xd6
	for <openbmc@lists.ozlabs.org>; Mon, 02 Feb 2026 22:19:37 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-481188b7760so27869215e9.0
        for <openbmc@lists.ozlabs.org>; Mon, 02 Feb 2026 03:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1770031173; x=1770635973; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vkH3uyDe1IYJlfN4Vrhf9/CvNIbaIvxv6mm2y5l5B9I=;
        b=fIEV1KvDsjB65qqXDAPe+jag4H0gFpwrKkPR+g43TD+WYGvVY9DAa9g9vDRxhSl3/V
         6ra4QJdLkRHYLBV7FxcMaJ5yulkhukUNBxUkVeeLR5ZiBad/W+y5zBlmZ7xwuDjImwN5
         9E/dtA618gcjUs6+qvzv5GFqZt8XdaBHfdmzB5GiQkowYGsgxYUP71b3IBv86aYJBdhA
         vt5hiYqDnRnCdHpq4FoFRisNScS6BucI0sjsxqxrV2bTV0ElcdaG1GNfE9PmPbUQlG3s
         s1lIdWPgVgsGbRbgTu2hycPzzgNGX51JOCyDEIeI6mbC+m2CHBGqaLxwrmTSQVB6CUi0
         ulKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770031173; x=1770635973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vkH3uyDe1IYJlfN4Vrhf9/CvNIbaIvxv6mm2y5l5B9I=;
        b=f1633NKhOjt1+639tq4KDJcphF9Blnd4SXNFKNiDtfCD/yzzjgL5nP07btYcIdRq86
         6GjgWbvztWB9nDQMNaOg2U/NM7mdWnTUJvY4sZ4VUlhIpMen5dbLOfKymzRnCxKkIeSx
         G/DvPFAStnoVjZHSANqJrAe+jvFlS47j+coQipYpXRmhTENBZBBG+4MIaljoms12bMM0
         2jFXoXo/ahwiVWUBpHQKUI4mstgPzqS/uWOM7d2bzp0flnwpBBq3BZT9bfqUtaW/wWoO
         V+fO4f+D4Aj4e72FP7tNZtCAmSoQ8p853lnQE2uDJRnivVLJzF6miks1X4EScw0CjI4Z
         0pcg==
X-Gm-Message-State: AOJu0Yz9lCrJJEkuiQQuqohpitAArH/XMnTYM2Oi+fMo2uOKtiGD4DoB
	fG3h99BhZgg1n/c07/rdRz53GuJ1AtM0Kpomxa/lZSoYk282OBowc16Yle7lVCxU+0OcJp5J/jB
	dfF+O
X-Gm-Gg: AZuq6aKnKQk8H0rVAE2fj1xiUS3RZ0xLh0LF+LkaGtCLDCe6pmn39UEqtR6DM/Jiwe1
	iKfiaoaWoPkg8C0PuQrZZ4DCa/btzaiCMi0FQ3fSCfsVXUlmX+jYvwZBjx3eSn7y2i8tjc1fBsG
	urWGiwiJ0yfEkTJGkO3LYCxSnbDPZmVgOl2V7HJjrTSEcWETA0ErvGxLozc4mmzP/ldGL+/3Bpj
	kARRZKjlKJacab37u9S3/hYZIHDAx9Q8hX1r+ImLkbemHKt4bxPcw6MaPymVEWarREhunINbK7j
	/zd8E7AJfHaltI5TiQcISzpAswS+aQ+sNNhKinprTfs0QuQCvJjOOsH6hkT+x1TR14KYr8iDPKj
	ZFVNuaOT3f5UrYd3kJV7Pe7xO+InxSHnTuPjxDbgE8/El0n3emVXgW8sAJ4TU6gtHJNQ2e+8Iwh
	pb7zOvyvgJG5DfHR/R8sYxNGULFuPNod0BlTk1Eh8Vwlos3LYqtPJVrSaEjR4CVBbiC2GFLZY5o
	xDb
X-Received: by 2002:a05:600c:4ecd:b0:480:3230:6c89 with SMTP id 5b1f17b1804b1-482db4616damr145869025e9.12.1770031173368;
        Mon, 02 Feb 2026 03:19:33 -0800 (PST)
Received: from [10.93.128.226] (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c428basm478784975e9.12.2026.02.02.03.19.32
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 03:19:33 -0800 (PST)
Message-ID: <473fac36-69a2-4675-8bfa-de26170387cf@9elements.com>
Date: Mon, 2 Feb 2026 12:19:32 +0100
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: TOF elections for 2026H1
To: openbmc@lists.ozlabs.org
References: <aXDmS4BmR6AGXKGW@heinlein>
Content-Language: en-US
From: Christopher Meis <christopher.meis@9elements.com>
In-Reply-To: <aXDmS4BmR6AGXKGW@heinlein>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.20 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[9elements.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[9elements.com:s=google];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-1313-lists,openbmc=lfdr.de];
	DKIM_TRACE(0.00)[9elements.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.meis@9elements.com,openbmc@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[openbmc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,9elements.com:mid,9elements.com:dkim]
X-Rspamd-Queue-Id: 2D59AD285A
X-Rspamd-Action: no action

Am 21.01.26 um 15:44 schrieb Patrick Williams:
> Hello,
> 
> It is time again for TOF elections.  The current roll-call is available
> at:
>      https://github.com/openbmc/tof-election/tree/main/2026H1/rollcall.json
> 
> For this half, we have 4 seats up for election.  Currently those are
> held by Andrew Jeffery, Patrick Williams, Jagpal Gill and Jayanth Othayoth.
> All 4 are eligible for re-nomination / re-election.
> 
> Nominations for those 4 seats may be sent to the mailing list by
> replying to this email.  Only those eligible to vote may nominate or be
> nominated.
> 
> Nominations are due by Sunday Feb 15, 2026.  The election, if
> required, will be held beginning March 1st with more details to follow.
> 
> As usual, disagreements with the rollcall results can be raised to the
> TOF.
> 

I nominate Alexander Hansen (pointbazaar)

