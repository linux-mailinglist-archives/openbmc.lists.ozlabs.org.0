Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5FD7434C
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 04:29:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vGPT0DbQzDqNp
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 12:29:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vGNx5QMjzDqLx
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2019 12:28:48 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Wed, 24 Jul 2019 22:29:22 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: CLI Tools
Message-ID: <20190725022922.dqwkb2g4djsnobnw@thinkpad.dyn.fuzziesquirrel.com>
References: <904952B3-C01C-489C-BDD6-AB96F6734201@fb.com>
 <dd457a99-5202-415c-abb6-b4fad030e9ee@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <dd457a99-5202-415c-abb6-b4fad030e9ee@www.fastmail.com>
Content-Transfer-Encoding: quoted-printable
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Wilfred Smith <wilfredsmith@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jul 25, 2019 at 11:06:13AM +0930, Andrew Jeffery wrote:
>Hi Wilfred,
>
>On Wed, 24 Jul 2019, at 14:04, Wilfred Smith wrote:
>> There was a discussion a while back (2 years ago? In
>> https://lists.ozlabs.org/pipermail/openbmc/2016-November/005307.html)
>> where the OP (Patrick Williams) expressed concern over the
>> proliferation of command line tools. Patrick=E2=80=99s interest involv=
ed how to
>> integrate iotools. Others chimed in questioning whether it=E2=80=99s b=
etter to
>> provide compact commands for common needs or encourage exploration by
>> requiring longhand. Patrick inquired about the target audience for the
>> tools.
>
>I'm all for helpers for common tasks. If we can integrate them into obmc=
util
>that would be ideal. The alternative is that we require people write thi=
ngs like:
>
># busctl set-property `mapper get-service /xyz/openbmc_project/control/h=
ost0/auto_reboot` /xyz/openbmc_project/control/host0/auto_reboot xyz.open=
bmc_project.Control.Boot.RebootPolicy AutoReboot b false
>
>to disable auto-reboot or
>
># busctl set-property xyz.openbmc_project.Network /xyz/openbmc_project/n=
etwork/eth0 xyz.openbmc_project.Network.EthernetInterface DHCPEnabled b 1
>
>to switch DHCP on. Quite frankly that's a ridiculous requirement to forc=
e on
>everyone.

Years ago when Patrick wrote the referenced note, the belief was that=20
the OpenBMC DBus API would be stable.  But that thinking has long since=20
been rejected - the OpenBMC DBus is not stable and as such it probably=20
doesn't make sense to be sharing it (via busctl commands) with our=20
users?

>
>Having said that some of these already have shortcuts, such as
>
># systemctl stop host-failure-reboots@0

It might already be too late, but we probably should not have presented=20
systemctl commands as stable interfaces for our users either, for the=20
same reasons as I've mentioned above.

>
>for the auto-reboot line above, however the fact that it's a systemd uni=
t
>isn't exactly intuitive either.
>
>So I'm happy for people to propose e.g. sub-commands for obmcutil to
>help out. We might need more feedback than just my opinion though :)
>
>Andrew
