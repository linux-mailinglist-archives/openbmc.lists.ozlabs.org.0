Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CC48311B0
	for <lists+openbmc@lfdr.de>; Thu, 18 Jan 2024 04:16:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=DgDM4mwd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TFnwN4Cxhz3bqh
	for <lists+openbmc@lfdr.de>; Thu, 18 Jan 2024 14:16:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=DgDM4mwd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=alexander.hansen@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TFMf962wQz3bwk
	for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2024 21:33:04 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-55969c01168so4266585a12.1
        for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2024 02:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1705487581; x=1706092381; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8NG5VOuH9U8ODXiORZ8Pq8gKXdA/1Xg7Ps0LVUjZQw=;
        b=DgDM4mwdBGNJ+uoePdMf86mil3Yk+Hp5n45ZvRrNsZ0zAwAxqTIftu0ONoSGC+O4Bd
         9S6RMKB1ScuUhBq7Aucu/zJwaPLudMcbbZe8YYBlNmnM3FMTIIm4EVKfTxlx/Rc4EAa9
         tO7KZd4shSmAX6Isv85MLub8T06VuEF72K5OhdQCaZKEbC2KnPiUHjvVQNPe/v0Q3419
         q2rspvd1bSr7kL2QU6T/AO7OYYPvkPtHiE9GEA1fA5wXRpw2In93QegM20l6zStBhsFv
         c++uuY0gjoTClN0P19Aq0/e/HiodeizWXjx49DC7/DBN4cf2i/0LAuJkKIoTpFKtGK7m
         38Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705487581; x=1706092381;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8NG5VOuH9U8ODXiORZ8Pq8gKXdA/1Xg7Ps0LVUjZQw=;
        b=IRVa5ctjuOqSBdkjQPgZJNXYt4FfkCOqv4j9H8IQnOfSqiB0qKb8WVMrM8imFRCgIx
         b7ciDb4XhqKivPppJWTJc6DAQbrRKJ7N5syqepXk5VjQbRHFbVLwmpZIbbbenbBqawAF
         UVYMPv5XrYtL00AB50B/zU9DDHO3qhW3Qp7i26MWFmtNA6zZ5ZTfoAG/3qX+tQyvl6EU
         Ef72Ovtg3r1PiWLRJS6drZpu9B/JqBCmJs7JnKiZYpY0SsrViMA34RGYn3fR+JzKN4PA
         nmBkp8c7SourkL46xxOuBCEiYVyYvM9gZKM+KY4ppwJDeWPXlWgl7wT28xn6R4KauwtZ
         krkA==
X-Gm-Message-State: AOJu0Yy5X7yse3zcnx3ZqYFoqyJqF9dJGqbiW9mHfh5cFUYMqJGaYAPR
	N9LFZScEFAzmbPXx0KyEktWu3bfwiJou3g0fa4JbivqI8t0=
X-Google-Smtp-Source: AGHT+IEz68CCXjoRnMya9e0E3R3NwSiqEha5p1CsSDsqhdi3nqipzpv0r7UP9i4ooIsXYzVSI+O63w==
X-Received: by 2002:a17:907:b85:b0:a28:ac72:4570 with SMTP id ey5-20020a1709070b8500b00a28ac724570mr539846ejc.21.1705487580815;
        Wed, 17 Jan 2024 02:33:00 -0800 (PST)
Received: from [10.93.128.52] (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id m5-20020a170906258500b00a26e4986df8sm7587917ejb.58.2024.01.17.02.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 02:33:00 -0800 (PST)
Message-ID: <e9666dda-5236-40e1-bbeb-1ab012dc1a0b@9elements.com>
Date: Wed, 17 Jan 2024 11:32:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: patrick@stwcx.xyz
References: <ZaWZY3A4TZth-ons@heinlein.vulture-banana.ts.net>
Subject: Re: TOF elections for 2024H1
Content-Language: en-US
From: Alexander Hansen <alexander.hansen@9elements.com>
In-Reply-To: <ZaWZY3A4TZth-ons@heinlein.vulture-banana.ts.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 18 Jan 2024 14:16:23 +1100
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


I (pointbazaar) nominate myself to join the TOF.

