Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 380F7241FC1
	for <lists+openbmc@lfdr.de>; Tue, 11 Aug 2020 20:34:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BR1hj4d0wzDqRG
	for <lists+openbmc@lfdr.de>; Wed, 12 Aug 2020 04:34:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=PQlHQXFO; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BR1g90HjJzDqK3
 for <openbmc@lists.ozlabs.org>; Wed, 12 Aug 2020 04:33:23 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id B415C4C8A1;
 Tue, 11 Aug 2020 18:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1597170795;
 x=1598985196; bh=6VoRLsMVYlqCW49TeLKPg5AHoRfaLHf672gqEQbZuPU=; b=
 PQlHQXFOTNtd9hDokF5TCeUul8PRF1DTwJDzHmaSNPAzHBuxAFHUWLNzytOsFEzu
 YQXnLq+fS4F+vobLexXHw24LFn9951h2L+UM6BQgAiQjJVkwK+ix8U8fUCdT0XHb
 EweHOoN2yCLM8mWjqUjPlllf3QCHB8E4OECg4O/Ed3M=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 46bdiuM757iw; Tue, 11 Aug 2020 21:33:15 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 102DC4C87E;
 Tue, 11 Aug 2020 21:33:14 +0300 (MSK)
Received: from localhost (172.17.14.122) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 11
 Aug 2020 21:33:14 +0300
Date: Tue, 11 Aug 2020 21:33:14 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: The Power9 host booting problem with OpenBMC kernel 5.7.x
Message-ID: <20200811183314.GA26661@bbwork.lan>
References: <20200810184446.GA14652@bbwork.lan>
 <CACPK8XdFNpsyzgY8n_3VTxS-Z88bT1pBEXPO+w=dWE6G1fj3jA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CACPK8XdFNpsyzgY8n_3VTxS-Z88bT1pBEXPO+w=dWE6G1fj3jA@mail.gmail.com>
X-Originating-IP: [172.17.14.122]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Cc: Artem Senichev <artemsen@gmail.com>, openbmc <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>, Eddie James <eajames@linux.ibm.com>,
 "Alexander A. Filippov" <a.filippov@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Aug 11, 2020 at 06:12:30AM +0000, Joel Stanley wrote:
> On Mon, 10 Aug 2020 at 18:48, Alexander A. Filippov
> <a.filippov@yadro.com> wrote:
> >
> > Since the kernel in OpenBMC was updated to 5.7.x we have a problem with the P9
> > hosts booting.
> > On host with one Power9 CPU the failure happens during the Petitboot is trying
> > to initialize the network and it leads to host restarts.
> > On host with two Power9 CPU the same failure happens during OS booting. It
> > increases boot time, but at the end the host OS is completely started.
> 
> Oh no. I have spent some time testing the 5.7 tree primarily on
> Tacoma, our ast2600/p9 platform. We saw some strange systemd failures,
> where services such as udevd and journald would be killed by systemd's
> watchdog functionality. I did some preliminary debugging but didn't
> find a root cause.
> 
> I have since published a 5.8 based tree that does not suffer from this
> issue. Could you give that a spin on your hardware and see if it
> recreates your issue?
> 
>  https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/35315
> 

With the kerenl 5.8 the host is still not booting.
I've checked on both machines and they have very different results:
 - On the machine with two CPUs the issue is still reproduced.
   I see no difference, neither in the behavior, nor in the logs.
 - On the machine with one CPU the failure happens due the PNOR flash.
   It looks like this:

[ 16:23:27 ] --== Welcome to Hostboot hostboot-9865ef9/hbicore.bin ==--
[ 16:23:27 ] 
[ 16:23:27 ]   5.31049|secure|SecureROM valid - enabling functionality
[ 16:23:30 ]   8.00820|Booting from SBE side 0 on master proc=00050000
[ 16:23:30 ]   8.04587|ISTEP  6. 5 - host_init_fsi
[ 16:23:30 ]   8.21815|ISTEP  6. 6 - host_set_ipl_parms
[ 16:23:30 ]   8.40171|ISTEP  6. 7 - host_discover_targets
[ 16:23:32 ]   9.55142|HWAS|PRESENT> DIMM[03]=A0A0000000000000
[ 16:23:32 ]   9.55144|HWAS|PRESENT> Proc[05]=8000000000000000
[ 16:23:32 ]   9.55145|HWAS|PRESENT> Core[07]=33FFC30000000000
[ 16:23:33 ]  10.38865|ISTEP  6. 8 - host_update_master_tpm
[ 16:23:33 ]  10.41071|SECURE|Security Access Bit> 0x0000000000000000
[ 16:23:33 ]  10.41072|SECURE|Secure Mode Disable (via Jumper)> 0x8000000000000000
[ 16:23:33 ]  10.41089|ISTEP  6. 9 - host_gard
[ 16:23:33 ]  10.68154|HWAS|FUNCTIONAL> DIMM[03]=A0A0000000000000
[ 16:23:33 ]  10.68156|HWAS|FUNCTIONAL> Proc[05]=8000000000000000
[ 16:23:33 ]  10.68157|HWAS|FUNCTIONAL> Core[07]=33FFC30000000000
[ 16:23:33 ]  10.68776|ISTEP  6.11 - host_start_occ_xstop_handler
[ 16:23:34 ]  11.10376|ECC error in PNOR flash in section offset 0x030DF600
[ 16:23:34 ] 
[ 16:23:34 ]  11.10387|System shutting down with error status 0x60F
[ 16:24:52 ] 
[ 16:24:52 ] 
[ 16:24:52 ] --== Welcome to SBE - CommitId[0xc58e8fd0] ==--


   After that the PNOR flash is corrupted and all other trying to boot stops
   at stage 'SBE starting hostboot'.

I've noticed that the kernel 5.8 detect the flash driver incorrectly:
mx25l51245g instead of mx66l51235f.
It happens on both machines and I don't understand why it leads to the problems
on only one of them.

After restoring the previous firmware and power cycle both machines work fine.

> > So, I have two questions:
> > - Could you please, check if Romulus is also affected by this issue?
> > - Do you have any idea what is going wrong?
> 
> I'll fire up a romulus and see if it reproduces.
> 
> My guess is it's something to do with the timekeeping, irq or rcu
> code. All areas of complexity!
> 
> Thanks for the report.
> 
> Cheers,
> 
> Joel
> 
> > I've attached the tarball with full logs.
> > - poopsy is a system with two Power9 CPU
> > - whoopsy is a system with one Power9 CPU
> >
> > --
> > Regards,
> > Alexander

--
Regards,
Alexander
