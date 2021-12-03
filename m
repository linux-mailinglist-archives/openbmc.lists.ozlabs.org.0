Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFCE467055
	for <lists+openbmc@lfdr.de>; Fri,  3 Dec 2021 03:57:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4yCb5kwtz3036
	for <lists+openbmc@lfdr.de>; Fri,  3 Dec 2021 13:56:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=perches.com
 (client-ip=216.40.44.93; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
X-Greylist: delayed 369 seconds by postgrey-1.36 at boromir;
 Fri, 03 Dec 2021 13:56:45 AEDT
Received: from smtprelay.hostedemail.com (smtprelay0093.hostedemail.com
 [216.40.44.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4yCK2J5yz2yfb
 for <openbmc@lists.ozlabs.org>; Fri,  3 Dec 2021 13:56:43 +1100 (AEDT)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave06.hostedemail.com (Postfix) with ESMTP id 2E7C780EA3FA
 for <openbmc@lists.ozlabs.org>; Fri,  3 Dec 2021 02:50:37 +0000 (UTC)
Received: from omf08.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 45C6D1815C4CB;
 Fri,  3 Dec 2021 02:50:30 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf08.hostedemail.com (Postfix) with ESMTPA id A7C1C20038; 
 Fri,  3 Dec 2021 02:50:28 +0000 (UTC)
Message-ID: <10e59e850894524d34cc7d89c126ab9133e6a1a7.camel@perches.com>
Subject: Re: [RFC Patch v2 1/3] i2c debug counters as sysfs attributes
From: Joe Perches <joe@perches.com>
To: Sui Chen <suichen@google.com>, linux-kernel@vger.kernel.org
Date: Thu, 02 Dec 2021 18:50:27 -0800
In-Reply-To: <20211203023728.3699610-2-suichen@google.com>
References: <20211203023728.3699610-1-suichen@google.com>
 <20211203023728.3699610-2-suichen@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A7C1C20038
X-Spam-Status: No, score=-3.21
X-Stat-Signature: ywct6uirwhdagy39zibat4wycbdx5x6u
X-Rspamd-Server: rspamout04
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19jdsD/Pinoi7TG5JJ2y9H0VAQekIuvdUA=
X-HE-Tag: 1638499828-864565
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
Cc: benjaminfair@google.com, andrew@aj.id.au, openbmc@lists.ozlabs.org,
 tali.perry1@gmail.com, krellan@google.com, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2021-12-02 at 18:37 -0800, Sui Chen wrote:
> This change adds a few example I2C debug counters as sysfs attributes:
> - ber_cnt (bus error count)
> - nack_cnt (NACK count)
> - rec_fail_cnt, rec_succ_cnt (recovery failure/success count)
> - timeout_cnt (timeout count)
> - i2c_speed (bus frequency)
> - tx_complete_cnt (transaction completed, including both as an initiator
>   and as a target)
> 
> The function i2c_adapter_create_stats_folder creates a stats directory
> in the device's sysfs directory to hold the debug counters. The platform
> drivers are responsible for instantiating the counters in the stats
> directory if applicable.

Please try to use scripts/checkpatch.pl on your patches and see if
you should be more 'typical kernel style' compliant.

Ideally, use the --strict option too.

