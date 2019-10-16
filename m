Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF39D87BE
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 07:07:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tKzD3yJJzDqfc
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 16:07:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=santosh.puranik.ibm@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tDOQ74vi"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tKyL6FD7zDqVV
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 16:06:15 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id q5so13888424pfg.13
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 22:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=CXXk2pWhWffTW0NK5vZxBA0H9J4p45hHzZv+rw2JERA=;
 b=tDOQ74viCf/lnwuspOV4/jVh9JNqaDw1lMqeRIKf/2Oi/qDDZQmItSwRRMdp4gjF4H
 n70TH1EhipRNcdaHFghSoIR7YPCY6TeqbF224xNK8yEWcFrH6El5Hk0TNa0Hk+XreImD
 cr9kpUqltK4we6xpA1sfgSRPNOka83KH9en3S0ZwFLqoEkMphLrSuTD/22qns1mmuxdY
 8Q69MaRh67/glcO3FV2yh28iblKGD74nXNNthC0UNEU1hPts+meTLYE6sypSJnzwvMwb
 c5tLndOmd/d12cDyHmKNYQqXXJqb2CEzJm1fxbI7SAIZZE3VzuE267Pkuvf4dW1r6QBk
 JYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=CXXk2pWhWffTW0NK5vZxBA0H9J4p45hHzZv+rw2JERA=;
 b=E1F5rn6f/KqfZeMnrHtEICLIzLhLUh1gPh2aA8Th2umODbyZ6VT2m6q8OoYAGkfM8F
 Urkfl2zTYE2bNUb9FBTYQpcNCBYLn4HZl4RAGZRPeW4RHRBWwNx6uUe9b13NBwVfqmT5
 wevlwz4175+T8bPDYMIDZjW6gEcL8dthSTyb7xvWZ10UtzHn652IZVmVVUoVlagcq8E8
 4bmhKmywWdY0uNkhvb9WsxTvo9H96S0JTsyYp2wvBoVPQ7u36sCAFBixAWa0pkNcjujC
 LqM+indXA74qxGEpsxidJXzF3Xn52SrIvVpuExdY4op6f2PZdmu/tSyd/XostlPB4i0W
 D2Ww==
X-Gm-Message-State: APjAAAW/KQfYcQth1ufh8LhHGwMCgaEGa2NfbIm6fW83KX/iXe4BjOth
 tvAv0TTAFC+yeVIIejDucVk3EbZZ
X-Google-Smtp-Source: APXvYqxNVe2lulSFAeysQGpZWjhFrYVBZZL2BjmiiXC1An5vSJU3wb3nZ70vIQMaWbDxTEiTDWkB8w==
X-Received: by 2002:a65:464b:: with SMTP id k11mr24580886pgr.263.1571202371635; 
 Tue, 15 Oct 2019 22:06:11 -0700 (PDT)
Received: from [9.199.76.54] ([129.41.84.82])
 by smtp.gmail.com with ESMTPSA id q29sm426978pgc.36.2019.10.15.22.06.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Oct 2019 22:06:11 -0700 (PDT)
Subject: Re: [PATCH linux dev-5.3] ARM: dts: aspeed: rainier: Add i2c eeproms
To: Jinu Thomas <jinujoy@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 openbmc@lists.ozlabs.org
References: <2fd6a175-e249-741a-7f20-67705b9800e6@linux.vnet.ibm.com>
From: Santosh Puranik <santosh.puranik.ibm@gmail.com>
Message-ID: <0e2039fd-7257-5ab3-047c-95daa8eb9598@gmail.com>
Date: Wed, 16 Oct 2019 10:36:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2fd6a175-e249-741a-7f20-67705b9800e6@linux.vnet.ibm.com>
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


On 16/10/19 9:51 AM, Jinu Thomas wrote:
> Added eeproms for the below VPD devices
> - BMC
> - TPM
> - System Planar
> - DCM 0 VRM
> - DCM 1 VRM
> - Base Op panel
> - Lcd Op panel
> - DASD (All)
> - PCIe Cards (All)

The content matches the schematics. The indentation seems off, though.

Reviewed-by: Santosh Puranik <santosh.puranik.ibm@gmail.com>
