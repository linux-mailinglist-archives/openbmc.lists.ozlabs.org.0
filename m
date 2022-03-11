Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D90104D5E02
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 10:00:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFKdH61LGz30H5
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 20:00:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=BTwuQE0Y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.123;
 helo=smtp-relay-internal-1.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=BTwuQE0Y; 
 dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFKc56V1pz30Gd
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 19:59:01 +1100 (AEDT)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 60A3A3F1DE
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 08:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646989139;
 bh=0knUq+nj9peEmS1Svs4MEOnTn+oxEzDhNDhC8HFWh70=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=BTwuQE0Y+2RRIreddBlEqgV2MkER+bsd1IKgqfhmeiSJybopa7NukAOcqE+s2tc+h
 Zx9pEtqRwT5FjtPP7UD9C7uHTuq2ypg0wRzkssLtVMSrRJHlQH1nyOstisLiSj+SRk
 8PTorEWWT43oOi6p0UK60UDDeSFWV6td+SDFgzXddm2imiJhwzzHuuqK4JeQYQ80v8
 4+zCRiyOXJ7el+oQq1G+xQdDhKhIinyJTpwIhrytP2BRPwztAS4BPDVl8Za9DZtUPJ
 21WJqvRhWbkv813g9Zp4QzsIYExaltNq1N+ZS/pcWjsYCccofeQ0DPnOhqfYOJlDVT
 KDre3bZJoT3Gg==
Received: by mail-ej1-f71.google.com with SMTP id
 l24-20020a170906a41800b006da873d66b6so4568276ejz.3
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 00:58:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0knUq+nj9peEmS1Svs4MEOnTn+oxEzDhNDhC8HFWh70=;
 b=kUA2nIfP2akzkwrxqR32oCxzOQbsim7d7UZzzBOYj3itEN81dBJbbE5ujr6p/w8HFa
 jTeipVHzTlRn1FS5d2OYIEmY98JNfiuICoqwm0nx4CWtCYAkj8guX0mqkFheHdAYjidc
 RmtNa1UZ+of7AC3TIkvNR/2g8JzOekHrTNyWGW3poTn/0VpHf5bwMZafBEoL/hcqfL4X
 etNtxek1WYOGmqb1Y1Axq6QO0HWr3SLTe4uUCOzijBbxryBAq7nP1W8lB6+BdsOFhuEp
 3IogQiKaC0Hj6lqA3zSV7eh+9QcSCjaF2RV7++2CRfBXA1BRJqEqPcdyGOtwrIYJxllz
 qiCg==
X-Gm-Message-State: AOAM531FmGhbujwWZiHxtIyeC+Tp7pVUfLjT85eN1rkWGZ+RmJQPasrH
 We85AK3Gt3wYZzkynpBMz7pff0Z2HNN5a3rNAHATAdjUvXEkBzujZ8aPyw7GnZp6S81Rv2RcXoa
 fXa43NTp3SRvbT9zLQmfubATrBCH/u5a9iQFD
X-Received: by 2002:a17:906:4fc2:b0:6db:718f:7b18 with SMTP id
 i2-20020a1709064fc200b006db718f7b18mr7304023ejw.412.1646989139047; 
 Fri, 11 Mar 2022 00:58:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJ0MYmCOnRGydkzT13dr5ZvqsEe8P/UTOTbqINId0zENiFAHB5jwB73TPSN7i3f0Z42WkHBw==
X-Received: by 2002:a17:906:4fc2:b0:6db:718f:7b18 with SMTP id
 i2-20020a1709064fc200b006db718f7b18mr7303993ejw.412.1646989138835; 
 Fri, 11 Mar 2022 00:58:58 -0800 (PST)
Received: from [192.168.0.148] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 fq14-20020a1709069d8e00b006da650af5a9sm2680769ejc.3.2022.03.11.00.58.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 00:58:58 -0800 (PST)
Message-ID: <b9eb6b6b-b295-4d10-d4f2-c56461994d71@canonical.com>
Date: Fri, 11 Mar 2022 09:58:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/3] ARM: dts: nuvoton: Add new device node
Content-Language: en-US
To: Medad CChien <medadyoung@gmail.com>, rric@kernel.org,
 james.morse@arm.com, tony.luck@intel.com, mchehab@kernel.org, bp@alien8.de,
 robh+dt@kernel.org, benjaminfair@google.com, yuenn@google.com,
 venture@google.com, KWLIU@nuvoton.com, YSCHU@nuvoton.com,
 JJLIU0@nuvoton.com, KFTING@nuvoton.com, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, ctcchien@nuvoton.com
References: <20220311014245.4612-1-ctcchien@nuvoton.com>
 <20220311014245.4612-2-ctcchien@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220311014245.4612-2-ctcchien@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/03/2022 02:42, Medad CChien wrote:
>  Add NPCM memory controller device node
> 
> Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> ---

Subject is too generic. Describe shortly what are you adding.


Best regards,
Krzysztof
