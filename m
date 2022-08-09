Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6364058D3F7
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 08:42:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M23RM25D8z3blQ
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 16:42:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M23R40HRrz2xH8
	for <openbmc@lists.ozlabs.org>; Tue,  9 Aug 2022 16:42:37 +1000 (AEST)
Received: from [192.168.0.2] (ip5f5aecbd.dynamic.kabel-deutschland.de [95.90.236.189])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id D747D61EA192A;
	Tue,  9 Aug 2022 08:42:29 +0200 (CEST)
Message-ID: <6d1576c9-f105-2aff-4497-2c2e7bed2f3b@molgen.mpg.de>
Date: Tue, 9 Aug 2022 08:42:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.1
Subject: Referencing non-public datasheets in commit messages (was: [PATCH v12
 3/3] EDAC: nuvoton: Add NPCM memory controller driver)
To: Borislav Petkov <bp@alien8.de>
References: <20220610084340.2268-1-ctcchien@nuvoton.com>
 <20220610084340.2268-4-ctcchien@nuvoton.com> <YrDIimW0gW1j03WG@zn.tnic>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <YrDIimW0gW1j03WG@zn.tnic>
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
Cc: KWLIU@nuvoton.com, tony.luck@intel.com, rric@kernel.org, benjaminfair@google.com, devicetree@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, tali.perry1@gmail.com, KFTING@nuvoton.com, ctcchien@nuvoton.com, james.morse@arm.com, medadyoung@gmail.com, YSCHU@nuvoton.com, mchehab@kernel.org, tmaimon77@gmail.com, linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Borislav,


Am 20.06.22 um 21:20 schrieb Borislav Petkov:
> On Fri, Jun 10, 2022 at 04:43:40PM +0800, medadyoung@gmail.com wrote:

[…]

>> Datasheet:
>>      Cadence DDR Controller Register Reference Manual For DDR4 Memories
>>      Chapter 2: Detailed Register Map
> 
> If that datasheet is not public, no need to mention it here. At least a
> quick web search cannot find something relevant.

Maybe it could be denoted, that is not public (and also the version), 
but even mentioning non-public datasheets is useful, as they could be 
made public in the future, and allows everyone to contact people with 
access to these datasheets to take a look into the specific datasheet.


Kind regards,

Paul
