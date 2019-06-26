Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C78E35C8EC
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 07:44:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dCq00765zDqLM
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 15:44:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="uiVKlIEB"; 
 dkim-atps=neutral
X-Greylist: delayed 452 seconds by postgrey-1.36 at bilbo;
 Thu, 27 Jun 2019 02:10:53 AEST
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Yp0s5mFPzDqTh
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2019 02:10:53 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id EB76E411FF;
 Wed, 26 Jun 2019 16:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:date:date:from:from:subject:subject
 :message-id:received:received:received; s=mta-01; t=1561564995;
 x=1563379396; bh=tN3E2vQ59f7mQbRM9ZzpyhmrT6/eDzCXgPYywwSVY3k=; b=
 uiVKlIEBK2s0EsBSAu3kIlpLU9zE04sjB338Vo5kIHOpDisEC6x+qJXazbZVe2f0
 mKe6UnlGm789dh5ABdc2jGbZguSnBt3ksF0d6fkEYs2r57JRekVl8RQb/aNqQsit
 Br3Ot+nKoq8zj3ALKZ549fkx+BeS5rd3920cOZDwEwI=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id voDlp0NXKWjY; Wed, 26 Jun 2019 19:03:15 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 8D721411FC;
 Wed, 26 Jun 2019 19:03:15 +0300 (MSK)
Received: from localhost.localdomain (172.17.15.69) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 26 Jun 2019 19:03:15 +0300
Message-ID: <ce4ba08f8d44c5e3d1f8a549578ce23c2311f39d.camel@yadro.com>
Subject: fsi/sbefifo problems on bmc
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: <eajames@linux.vnet.ibm.com>, <cbostic@linux.vnet.ibm.com>
Date: Wed, 26 Jun 2019 19:03:15 +0300
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.17.15.69]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-Mailman-Approved-At: Tue, 02 Jul 2019 15:42:20 +1000
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, openbmc@lists.ozlabs.org,
 Alexander Amelkin <a.amelkin@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Chris, Eddie, we're in the process of bringup of a P9 machine with openbmc
and we have a problem related to fsi and sbefifo as it appears.

There are some debug data from journalctl about what's happening with sbefifo
and fsi.


Jun 25 09:49:08 nicole phosphor-host-state-manager[1147]: Host State transaction
request
Jun 25 09:49:10 nicole kernel: sbefifo 00:00:00:06: DOWN FIFO Timeout !
status=00100000
Jun 25 09:49:10 nicole systemd[1]: Starting Soft power off of the host...
Jun 25 09:49:10 nicole systemd[1]: Created slice system-
phosphor\x2dreboot\x2dhost.slice.
Jun 25 09:49:10 nicole systemd[1]: Stopped target Host instance 0 crashed.
Jun 25 09:49:10 nicole systemd[1]: Stopped target Quiesce Target.
Jun 25 09:49:10 nicole systemd[1]: Reached target Stop Host0 (Pre).
Jun 25 09:49:10 nicole ipmid[1131]: Command in process, no attention
Jun 25 09:49:23 nicole phosphor-host-state-manager[1147]: Host State transaction
request
Jun 25 09:49:24 nicole systemd[1695]: systemd-hostnamed.service:
PrivateNetwork=yes is configured, but the kernel does not support network
namespaces, ignoring.
Jun 25 09:49:24 nicole systemd[1]: Started Hostname Service.
Jun 25 09:49:27 nicole ipmid[1131]: Host control timeout hit!
Jun 25 09:49:27 nicole ipmid[1131]: Failed to deliver host command
Jun 25 09:49:27 nicole ipmid[1131]: Failed to deliver host command
Jun 25 09:49:27 nicole phosphor-softpoweroff[1655]: Timeout on host attention,
continue with power down
Jun 25 09:49:27 nicole systemd[1]:
xyz.openbmc_project.Ipmi.Internal.SoftPowerOff.service: Succeeded.
Jun 25 09:49:27 nicole systemd[1]: Started Soft power off of the host.
Jun 25 09:49:27 nicole systemd[1]: Reached target Host0 (Stopping).
Jun 25 09:49:27 nicole systemd[1]: Reached target Host0 (Stopped).
Jun 25 09:49:27 nicole systemd[1]: Reached target Power0 Off (Pre).
Jun 25 09:49:27 nicole systemd[1]: Starting Wait for Power0 to turn off...
Jun 25 09:49:27 nicole systemd[1]: Started Stop Power0.
Jun 25 09:49:28 nicole power_control.exe[1051]: PowerControl: setting power up
SOFTWARE_PGOOD to 0
Jun 25 09:49:28 nicole kernel: sbefifo 00:00:00:06: Failed to read UP fifo
status during reset , rc=-19
Jun 25 09:49:28 nicole kernel: occ-hwmon occ-hwmon.1: failed to get OCC poll
response: -110
Jun 25 09:49:28 nicole kernel: occ-hwmon: probe of occ-hwmon.1 failed with error
-110
Jun 25 09:49:28 nicole kernel:  slave@00:00: error reading slave registers
Jun 25 09:49:28 nicole power_control.exe[1051]: PowerControl: setting power up
BMC_POWER_UP to 0
Jun 25 09:49:28 nicole systemd[1]: fsi-scan@0.service: Main process exited,
code=killed, status=15/TERM
Jun 25 09:49:28 nicole systemd[1]: fsi-scan@0.service: Failed with result
'signal'.

On the first run we have no problems with fsi and sbefifo and no issues with
fifo or problems with switching from SOFTWARE_PGOOD to BMC_POWER_UP. In the
consequenced reboots we have unresponsive host and only manual powercycle helps.

From my point of view it seems like the fsi slave became unresponsive which
resulted in the fifo problem and in problems with other stuff.
We're looking for some guidance on how to debug that. Maybe some hard fsi reset
via devmem could help?
Also maybe some debug output from fsi will help to understand what's going on?
I saw that there is 'trace_enabled' in coldfire's code but there is no option to
enable it, or is there another way to do that from some right place?

Thanks,

Ivan.

