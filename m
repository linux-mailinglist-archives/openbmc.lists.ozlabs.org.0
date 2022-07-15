Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0882575C48
	for <lists+openbmc@lfdr.de>; Fri, 15 Jul 2022 09:25:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LkjZ1414Yz3c75
	for <lists+openbmc@lfdr.de>; Fri, 15 Jul 2022 17:25:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LkjYm3hrsz3blD
	for <openbmc@lists.ozlabs.org>; Fri, 15 Jul 2022 17:25:15 +1000 (AEST)
Received: from [192.168.0.2] (ip5f5aeb39.dynamic.kabel-deutschland.de [95.90.235.57])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 6773961EA192C;
	Fri, 15 Jul 2022 09:25:10 +0200 (CEST)
Message-ID: <f518fc94-5534-0fac-c5fc-7059eb166b0c@molgen.mpg.de>
Date: Fri, 15 Jul 2022 09:25:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] tools: Disable OpenSSL
 deprecation warnings
To: Joel Stanley <joel@jms.id.au>
References: <20220715033327.1053462-1-joel@jms.id.au>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220715033327.1053462-1-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Joel,


Thank you for the patch.

Am 15.07.22 um 05:33 schrieb Joel Stanley:
> mkimage is linked against the host version of OpenSSL. If the distro
> happens to be using OpenSSL 3.0 then several warnings about using
> depreciated functions will be emitted.

sdepreciated/deprecated/

> 
>   warning: ‘RSA_get0_key’ is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
> 
> These functions still work for now, so suppress the warning and delay
> the need to move to the new API.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

[…]

Reviewed-by: Paul Menzel <pmenzel@molgne.mpg.de>


Kind regards,

Paul
