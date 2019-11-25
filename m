Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6675C10913F
	for <lists+openbmc@lfdr.de>; Mon, 25 Nov 2019 16:48:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MBJr1Wz1zDqX2
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 02:48:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::229;
 helo=mail-oi1-x229.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pwf/D/xo"; 
 dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MBHx5LPnzDqWj
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 02:47:39 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id l202so13546634oig.1
 for <openbmc@lists.ozlabs.org>; Mon, 25 Nov 2019 07:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Y879/MMoCAcSjtl/wGo3Y7g8ivwzI7fkst6a5zvLhHI=;
 b=Pwf/D/xoHQgf7DKntI4UId2nUvCtTzVNjqsh7oZc30dXQBaphKFNhHoK81WkUTpesX
 /34KXfeqUzKq4JgqD2LZ0KFpSLAZYZYPQfeV9qznwbU+nxj7FwvkaBy+ntqIVdoCDcM+
 dzvyMpew9aWp46L+XIxM1mV1y9OLK1PN9UGzEgvMy6amFgo4tWKih3gpWp0FKslbooqX
 kJg1k2TB7mnkU2Stmp/5zL4Ivk6FXoJZkP9GwfUGtrtEdMGUgjYfjLRzwnYAUvW+iPPJ
 Z6Jsy1FJmrxTHOwTnBQkuzycbF73NEWCaSGKl1TOtX49t/7b4WGmQWWds8pW0nnNo3Js
 Wh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y879/MMoCAcSjtl/wGo3Y7g8ivwzI7fkst6a5zvLhHI=;
 b=B0GO/S8B1FmKE5weelRub8dgO/H4h6zSdMvilscBbg892s1NbZad5Hqax6iYAdtcIZ
 QdM7G9QfQCxzyw/w6HiRghHffnR1pExMJY16K0VXrNA1p4AsIOR3LvGrHoBUMt1SXJQO
 ldyAAleV5qbymw/iGZIs2nIgL9efrErZvUX4pSgqayAnSSTgYgGJ6bg8OQT1ORBzqEcf
 tEiBprU9oj+DXVNHy0nBwCGmLDDwqlUf14S0qz1XAycq+uIaw6XnTzw+fSypoJv8qzOu
 OWK1sPVrOFG+uE+T0XZtnzQk1beZ5QVPC7CORt0NFO/x1uzDTKnbcUiTRDk/aBgWvltA
 H0RQ==
X-Gm-Message-State: APjAAAUl6I432U5fm7RdGoxR7JJpo27HoeyL32WvE8vffkF7iXzZe1Xr
 y1rg8QwjLCKzxeauvjDF4sdAB8Si
X-Google-Smtp-Source: APXvYqzyGo3Zf4ScFJuzwhEPbjAeO9pH0XTSarKHyKj0iEHjU3ogdXQTvKyMSiE9KksDChWwjXXZcQ==
X-Received: by 2002:a05:6808:681:: with SMTP id
 k1mr24049291oig.117.1574696856015; 
 Mon, 25 Nov 2019 07:47:36 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id a17sm2508865otq.58.2019.11.25.07.47.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Nov 2019 07:47:35 -0800 (PST)
Subject: Re: Is Intel-BMC/openbmc https://github.com/Intel-BMC/openbmc being
 kept up-to-date?
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>, openbmc@lists.ozlabs.org
References: <d410e08e4d1b48a5831f1af784f76a99@SCL-EXCHMB-13.phoenix.com>
 <54b60348-ca89-9801-7101-0926e56fd5ad@linux.intel.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <d189febe-b9c4-e2a1-ab9d-aba272851d99@gmail.com>
Date: Mon, 25 Nov 2019 09:47:34 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <54b60348-ca89-9801-7101-0926e56fd5ad@linux.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 11/20/19 5:12 PM, Bills, Jason M wrote:
> 
> 
> On 11/20/2019 3:07 PM, Bruce Mitchell wrote:
>> Is Intel-BMC/openbmc https://github.com/Intel-BMC/openbmc being kept 
>> up-to-date?
>> It seems openbmc/openbmc https://github.com/openbmc/openbmc gets 
>> merges that are not being merged into Intel-BMC/openbmc.
> Yes, I am responsible for keeping Intel-BMC in sync.  Unfortunately, I 
> am a few weeks behind due to some internal issues and priorities.  I am 
> working to get back to a normal sync schedule as soon as possible.

It would be easier to not have to keep them in sync.

Why not just put that effort into getting Intel's changes upstream into 
OpenBMC in the first place?

Just a thought.  :)

Kurt Taylor (krtaylor)

> 
> Thanks,
> -Jason
> 
>>
>> Thanks!
>>

