Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB18416A1E
	for <lists+openbmc@lfdr.de>; Fri, 24 Sep 2021 04:46:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFxHQ0NWFz3064
	for <lists+openbmc@lfdr.de>; Fri, 24 Sep 2021 12:46:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158;
 helo=codeconstruct.com.au; envelope-from=matt@codeconstruct.com.au;
 receiver=<UNKNOWN>)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFxH64d2Gz2yQ9
 for <openbmc@lists.ozlabs.org>; Fri, 24 Sep 2021 12:45:54 +1000 (AEST)
Received: from [192.168.12.102] (unknown [159.196.94.94])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 094022012C;
 Fri, 24 Sep 2021 10:45:50 +0800 (AWST)
Message-ID: <94429904ec0c9d75919cda42339a2fafcbc35fe4.camel@codeconstruct.com.au>
Subject: openssh-dev package and populate_sdk conflicts
From: Matt Johnston <matt@codeconstruct.com.au>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Sep 2021 10:45:49 +0800
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi OE list,

Recently OpenBMC merged a change to install openssh-sftp-server package
alongside dropbear sshd [1]. That caused a conflict in "populate_sdk" which
installs all available -dev packages [2]. 'openssh-dev' pulls in an
'openssh' -> 'openssh-sshd' dependency which conflicts with 'dropbear' [3].

What would be the recommended way to handle that situation? For now OpenBMC
has merged a change to disable building openssh-dev (it's empty since
openssh doesn't have libraries) [4].

Should non-library packages handle -dev packages differently? The default 
-dev package comes from bitbake.conf .

Cheers,
Matt

[1]
https://github.com/openbmc/openbmc/commit/26dbcdbd917e4f22fb400153da0d3e7255c8e646
[2]
https://github.com/openbmc/openbmc/blob/49465582e16221caf74cbdea11c87600a02bf47b/poky/meta/classes/populate_sdk_base.bbclass#L5

[3] https://github.com/openbmc/openbmc/issues/3819
 *   - package openssh-8.7p1-r0.arm1176jzs conflicts with dropbear provided
by dropbear-2020.81-r0.arm1176jzs
 *   - package openssh-dev-8.7p1-r0.arm1176jzs requires openssh = 8.7p1-r0,
but none of the providers can be installed

[4] https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/47089

