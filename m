Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DA2943722
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2024 22:30:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CtLyXOoz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZ3cb0ZkYz3dLc
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 06:30:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CtLyXOoz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZ3c41DPrz3c7K
	for <openbmc@lists.ozlabs.org>; Thu,  1 Aug 2024 06:29:38 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1fc60c3ead4so43929415ad.0
        for <openbmc@lists.ozlabs.org>; Wed, 31 Jul 2024 13:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722457775; x=1723062575; darn=lists.ozlabs.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZWMFt/nygWONmE8n04GAJa8b5N07i52qg/VGclywhE=;
        b=CtLyXOozvHL7VFV2Ba3hODxCFmuUvtZFjigk3pHhPPDI9Be3ZX5tnf0Ni1dT546bvz
         MZuo7Oe2VRfq9cuVDBdOhBx9ghAue7QEtB6iVLsgEbyeZvQLL6mAM8Gv2ja/UGU1M2UR
         GCFe3pgV4vn9RjhBqQHvTAOfZxSSCtFynoIdQvuWo3zJLBJdoMq53GBT58eh+MC+0Yqf
         mgKR64+naI8uRuobQ8AESMxEyiNcQESOKDBvGOMlbyCE3A8U5u8iCwDU2RtN5ujfn3Hi
         KREomE9VjMcm0ECErWvS3B/7T6cA7Ktkr+dreIMP2hAgNEFIEbmEZO2sAPRb+Y9WyH0s
         NsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722457775; x=1723062575;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4ZWMFt/nygWONmE8n04GAJa8b5N07i52qg/VGclywhE=;
        b=DSLe7W3M4LC+56RMwrJodmNjBtmSfB/t5DsbHTBaSeOEZJ2xWQPSIT1J5OFMBdCQLL
         xQe9dcOjRDqCWlCXRr8ETC6hnQu9Pl4dt87xwII+d4Gd6S4UmAW9hOKR+u+6d3OE/3sh
         FIjafvRDeajXWiPzRBMiAxKlePSYwTs7ArzvfrfCTAbb9ivhx65q1BwCAoHywQVcZqPt
         xt7UprhWA3UM2T0G5+5oJyK17CRN6LkB1GDrZM30ezTV6n+1OSNDwnRbLmuTp95I4h/A
         1bA/ehdeoJwZADFmN59VGB+l0yJGNUR8cJ3V8kFfSFM1NixKVztogi2ArNPtrigjzCDN
         sQVg==
X-Gm-Message-State: AOJu0YwW5jgslTcwCxlQDGnF0O44Bc7sCgtSS2htflGyjNTHjzBVctNw
	rNu7MYtJLpxkWym3ndonFW7htGB0r/9klvZf5Iq5ZQdPjShvSsRdyRNPbdOP
X-Google-Smtp-Source: AGHT+IGO7gqtcK8DPwywlKV7hKAJuBU5dKFuRQxiOpGB5qWlmzBVwS8BvP09dorfU8EkPnPF0EbT8w==
X-Received: by 2002:a17:902:cec7:b0:1fd:6655:e732 with SMTP id d9443c01a7336-1ff4d2688e4mr4517505ad.54.1722457775201;
        Wed, 31 Jul 2024 13:29:35 -0700 (PDT)
Received: from [192.168.1.50] (host97.186-124-166.telecom.net.ar. [186.124.166.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ff072asm124033635ad.296.2024.07.31.13.29.34
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 13:29:34 -0700 (PDT)
Message-ID: <cb3a0ff2-8c90-4826-b33a-160943fd3800@gmail.com>
Date: Wed, 31 Jul 2024 17:29:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "'openbmc@lists.ozlabs.org'" <openbmc@lists.ozlabs.org>
From: Andrew Geissler <geissonator@gmail.com>
Subject: slpd-lite CVE-2024-41660
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

Greetings,

Today we made public a CVE within the slpd-lite repository under OpenBMC.

The CVE is at https://www.cve.org/CVERecord?id=CVE-2024-41660

The fix was merged via this bump - 
https://github.com/openbmc/openbmc/commit/350cb5f326d52aa7bb6c423e07fdaf26292f3541

Andrew

