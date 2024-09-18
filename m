Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 777CA97BEF6
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2024 18:06:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X83S04wknz30Tq
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2024 02:06:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::531"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726675597;
	cv=none; b=i91fNubq8ih0FB4v5Spd0d08xmD8uTgX9TAL9AWsaeb9EZfjlLfPn5jNulu/X82CYJgN1ZEnvPN1d6cKakaUL2n76tlSdTis3TAamONkmZwvIaoWHiXx+c9f4m35XNKnafrDcHNHD4EeDSh0U1Fr9jObpu6ttkZy2weeUwIAuP6dHgY2LutBwscJDHWTyEUPCN89QAVYxAsDedV1ysMqVX4lmcj2t8NLo1gojuOQERJKTpILzDZCBw4oeu/MPRxopPHmfwcqi57sd3NmpdR3FtDH1FiN+J0NnBXJyShkKoiy8jq/5GSB1QiDJE9NvYjyzvoxA7N3J3nDU73lHLc9tw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726675597; c=relaxed/relaxed;
	bh=hEUkdACsbncnR17uoLmq0/q9Ux9Mp8bkH/W6kzjd5zg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GacjLowILYpIYwBWsd5FGgouS8mO4Xsr184/WeRlBJgA4BGbsuOwomPSfCW3OL2Qu5yNfUf8Xj6CxfsR7vutKjSJPaE/P0rviZHDoVP6gWQt4U093isWD2Uk/MCNH8wsjCYQE5sopEcaTzM2gNeUbWhOGtMTAPtP5DzCICDYWe8H53CfLwCp7U7iUPu+lwanXPS5dz60tnz7Y82r/tbKWYfigsPF/XIcd/iXG+To7KBs7AgqqDSwaa+0bz3blO8K+yI5oVls+QA9E9eD2sgBOwC2uByjUcXyJlwUj4T3g7tlmC6q0bdP+fL4kmJy7aFqr9YCarmpA1aGlDbronUNMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QHpDoXJc; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=manojkiran.eda@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QHpDoXJc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=manojkiran.eda@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X83Rx0pl1z2xHY
	for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2024 02:06:35 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7db233cef22so4240486a12.0
        for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2024 09:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726675590; x=1727280390; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hEUkdACsbncnR17uoLmq0/q9Ux9Mp8bkH/W6kzjd5zg=;
        b=QHpDoXJcGAIKtlCfoKdWZP4AdQy4pCBAvKDkyYHd8Wt3+QNx1/uBAizVfCmBbMT+pd
         zC5jqrlOimbsod8xSon/RY7gW7sqpk9Ui9B/+bwcgXcdU/lKvM36EQVFy4DTCbXHMiaz
         AAhDE9COGy25daonKTj3XeEPB1lgiRyam803O2v82W4aPCS/X/DRBzwz5Xos7JE3+suM
         qbGTCQKjc/oiLPpDufN538D03eGrt/7QuDTn3kx0YDm71AcE64ZbwRb6MWMNKAAF5aTj
         zqOMSg5GTpooY5o2AzFPSN+NZ+7WEEAviCpyvwT1O/uZ4GqWdxUEQfjFCtGVDk6hXM8V
         1J/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726675590; x=1727280390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hEUkdACsbncnR17uoLmq0/q9Ux9Mp8bkH/W6kzjd5zg=;
        b=i8+bMmdesBjK9jQ817tDBWu2n9BvlLQRxBSvPAQoWXOwLwgVnVCglao1lU5NxGt1qH
         03B24WtkidxlTzKtDeuUD29fuRaTmzF/a1DKa0aa39XPMrXE/19q8A5fQfiaCsmGDkL4
         rKNmerX4xLR2jOKegC+iyk0/tNmNan/z5SaoraVENYnhN4ujcePOB5y13F+wc82TByR3
         +S30m2QXUJGb/iPWJV+YXCC4sSp04aU5C+1YTYyIaSWussh+J3nFw0ILwAXVnp8HS+Cf
         /l9qVqQO7h2JDRKD0UBUJNgAmWOH6fgSDSKhEZ4LLzeovKfe4oVLu53WbPw9OINjALdl
         Wj1g==
X-Gm-Message-State: AOJu0Yxwx5TawjlFUJq1NoGZGmOXrUVu5lnzJZExJ0YyllpMFOH1xwOj
	icwyY7wYn2G+qEZ/5Z7mzHDgprS0daPyKQ+wX1i8fYVffpxLnQ+U5LZDLuXz
X-Google-Smtp-Source: AGHT+IGE0yMRvYLga2XMRY1flJEZchpGlTTzJQxUEO5hNh0LntxlAIno9/Qmq8yBT2g2dPT0Dsuzrw==
X-Received: by 2002:a05:6a21:398a:b0:1cf:21c7:2aff with SMTP id adf61e73a8af0-1d112cbc058mr32181240637.23.1726675590085;
        Wed, 18 Sep 2024 09:06:30 -0700 (PDT)
Received: from [192.168.29.219] ([49.43.225.83])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b7b5e0sm6890665b3a.108.2024.09.18.09.06.28
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 09:06:29 -0700 (PDT)
Message-ID: <9dfe1dc0-a032-4e24-b4b8-a23530543b9b@gmail.com>
Date: Wed, 18 Sep 2024 21:36:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: TOF elections for 2024H2
To: openbmc@lists.ozlabs.org
References: <ZttaJPIq6-jKt4eu@heinlein.vulture-banana.ts.net>
Content-Language: en-US
From: Manojkiran Eda <manojkiran.eda@gmail.com>
In-Reply-To: <ZttaJPIq6-jKt4eu@heinlein.vulture-banana.ts.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 07/09/24 1:08 am, Patrick Williams wrote:
> Hello everyone,
> 
> It is that time again for TOF elections.  The current roll-call is
> available at:
>      https://github.com/openbmc/tof-election/blob/main/2024H2/rollcall.json
> 
> For this half, we have 3 seats up for election.  Currently those are
> held by Andrew G., Ed, and Zev.  As Zev wrote earlier, he does not plan
> on rejoining.
> 
> Nominations for those 3 seats may be sent to the mailing list by
> replying to this email.  Only those eligible to vote may be nominated.
> 
> Nominations are due by Friday September 20th, 2024.  The election, if
> required, will be held immediately after with more details to follow.
> 
> As usual, disagreements with the rollcall results can be raised to the
> TOF.
> 

I'd like to nominate myself for the TOF.

Thanks,
Manoj
