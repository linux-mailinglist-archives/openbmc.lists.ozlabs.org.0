Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E81423B3528
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 20:02:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9nyq4phfz3btv
	for <lists+openbmc@lfdr.de>; Fri, 25 Jun 2021 04:02:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=fQpRjSL2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d36;
 helo=mail-io1-xd36.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fQpRjSL2; dkim-atps=neutral
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9nyS6JR5z307k;
 Fri, 25 Jun 2021 04:01:50 +1000 (AEST)
Received: by mail-io1-xd36.google.com with SMTP id f10so9368738iok.6;
 Thu, 24 Jun 2021 11:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=rhWDqKm/Z6fGnJdlKRNiulGkwn/9re9++vjaZyOdWG0=;
 b=fQpRjSL2khmMSQ07fSPAWaO2T7dWD8/bqmqqoN2MESvDxswARLmO+CVGNrLOEQv8X0
 UXdMhCzFMaDiQqxut6/6hII0DidLQLLXQVzQlDV9GOx+Kf3NGF058FYSESlybtHOG2zh
 x+OuIfO7KFAlyegffNW54R0pTUmuYO18v2TAcrJaWBEsmfPKxFQoSq+2Zu6TdXvap+xm
 BPs35yeRwszxKzqzxJnJWuKS8rXACpEjIzTlNKWY+1arB8XOl1z82kiy+g+EYFUAVPCD
 cFFqOT10xGhRKxVHN7+jOg0SlV4Srz/v8brkaNokBPqb6KBofjTrrQYI0oL21o8x8r4l
 4pbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=rhWDqKm/Z6fGnJdlKRNiulGkwn/9re9++vjaZyOdWG0=;
 b=m8Q2gdcfdz9wSNrL1da0uhyfvoXuB/se0hNRjdkjsfdHlshkddb7cRWf7aMXll2uD/
 Jus/6AFoIxr3CGiXc6J5TFedC1k04hgFSOm+hb2hi/RH1pMSBOAQJk3awaL7/wY9/szm
 ozElJA6d+MDY+fjmEZM8GcOe5lJ0/bVk9zY5mkIlsV7YLZtM5LIOgNWgJsrqW1wv1xmW
 7b4+6LLpOV6TKAZK5F/IM7OCzUNFNhfrOfDrp6PrqVxAcIK+LhTKu9sNRF1QPYAoNy5p
 TD3hUA/xrtDvnGkIIQrG2Gkca0/J//gsdBBClQvshXXMDonfaeyjSMdFZFEgsffH2mON
 rTGQ==
X-Gm-Message-State: AOAM530FKnZ6fNM4nA2kWXLLzcOVVqxnRwGBZXooWcfb3BquV7CxEfvI
 3967iliLjYf6lrwUkTet1BCzfPi5zk4qBw==
X-Google-Smtp-Source: ABdhPJzn59XtvV7GH04OGHTki2LP3Ap+yvKG4p8DnZ533MbUg9MAN78Bhls8WvWzO1XcN6JJEoD2MA==
X-Received: by 2002:a02:cba8:: with SMTP id v8mr5755923jap.111.1624557706014; 
 Thu, 24 Jun 2021 11:01:46 -0700 (PDT)
Received: from [192.168.4.31] (199-48-94-117.rochmnaa.metronetinc.net.
 [199.48.94.117])
 by smtp.gmail.com with ESMTPSA id h26sm1692843ioh.34.2021.06.24.11.01.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 11:01:45 -0700 (PDT)
Subject: Re: [PATCH] ARM: dts: aspeed: Rainier remove PSU gpio-keys
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org
References: <20210623230401.3050076-1-bjwyman@gmail.com>
 <7365c20e-541c-4e32-a907-0519534117ae@www.fastmail.com>
From: Brandon Wyman <bjwyman@gmail.com>
Message-ID: <c6f3dea3-b602-84a3-e06b-550672c3b6b8@gmail.com>
Date: Thu, 24 Jun 2021 13:01:45 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7365c20e-541c-4e32-a907-0519534117ae@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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


On 2021-06-23 18:08, Andrew Jeffery wrote:
>
> On Thu, 24 Jun 2021, at 08:34, Brandon Wyman wrote:
>> From: "B. J. Wyman" <bjwyman@gmail.com>
>>
>> Remove the gpio-keys entries for the power supply presence lines from
>> the Rainier device tree. The user space applications are going to change
>> from using libevdev to libgpiod.
>>
> Have they already added support for libgpiod? We should support both at
> least while we're switching over.
There is a change, hopefully nearing the end of review, that will 
support both.
>
> Andrew
