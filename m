Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 204DF2160EC
	for <lists+openbmc@lfdr.de>; Mon,  6 Jul 2020 23:20:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0z4t2WT1zDqdL
	for <lists+openbmc@lfdr.de>; Tue,  7 Jul 2020 07:20:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0z3z39lYzDqc4
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jul 2020 07:19:54 +1000 (AEST)
IronPort-SDR: UOVsab+bxs+I1GXkdANB/26AKy1MjzOvTmIsRf6kZH8bzCuHa5VpLG5ODXEKZxUP66m82JK/IB
 XmFz3WrF28lw==
X-IronPort-AV: E=McAfee;i="6000,8403,9674"; a="147516225"
X-IronPort-AV: E=Sophos;i="5.75,321,1589266800"; d="scan'208";a="147516225"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 14:19:50 -0700
IronPort-SDR: qPN3kdizH1adcFqdURdRSzkaHGg9UvGZMSnEAa3VeU9nVGWgfDJ80nBvkA8fbpzB3L9uyeCPv5
 yuN4/evkqsng==
X-IronPort-AV: E=Sophos;i="5.75,321,1589266800"; d="scan'208";a="456870142"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 14:19:50 -0700
Date: Mon, 6 Jul 2020 14:19:49 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
Subject: Re: Multi-host support in ipmbbridged and phosphor-host-ipmid
Message-ID: <20200706211949.GA47395@mauery.jf.intel.com>
References: <SG2PR04MB316063EDE5B383B87F33D96BA76A0@SG2PR04MB3160.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <SG2PR04MB316063EDE5B383B87F33D96BA76A0@SG2PR04MB3160.apcprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Kumar Thangavel <thangavel.k@hcl.com>, Ed Tanous <ed.tanous@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>, Vijay Khemka <vijaykhemka@fb.com>,
 Dawid Frycki <dawid.frycki@intel.com>, Patrick Williams <patrickw3@fb.com>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 03-Jul-2020 05:22 PM, Velumani T-ERS,HCLTech wrote:
>Hi All,
>
>We have a multi-host system and wanted to add support in openbmc to handle=
 all ipmi commands. We have come up with the design approach that could hel=
p us in handling ipmi command with multihost system. Please find the attach=
ed design proposal and provide feedback/suggestions.
>
>Regards,
>Velu
>
>::DISCLAIMER::
>________________________________
>The contents of this e-mail and any attachment(s) are confidential and int=
ended for the named recipient(s) only. E-mail transmission is not guarantee=
d to be secure or error-free as information could be intercepted, corrupted=
, lost, destroyed, arrive late or incomplete, or may contain viruses in tra=
nsmission. The e mail and its contents (with or without referred errors) sh=
all therefore not attach any liability on the originator or HCL or its affi=
liates. Views or opinions, if any, presented in this email are solely those=
 of the author and may not necessarily reflect the views or opinions of HCL=
 or its affiliates. Any form of reproduction, dissemination, copying, discl=
osure, modification, distribution and / or publication of this message with=
out the prior written consent of authorized representative of HCL is strict=
ly prohibited. If you have received this email in error please delete it an=
d notify the sender immediately. Before opening any email and/or attachment=
s, please check them for viruses and other defects.
>________________________________

>
>
># Multi-host IPMI design
>------------------------
>
>Authors:
>  Velumani T, [velumanit@hcl](mailto:velumanit@hcl.com)
>  Kumar T, [thangavel.k@hcl.com](mailto:thangavel.k@hcl.com)
>
>Primary assignee:
>
>Other contributors:
>
>Created:
>  2020-06-26
>
>1. Issue Descriptionption:
>--------------------
>The current version of openbmc does not support multi-host implementation =
in ipmi
>commands handling. We have a multi-host system and proposing the design to
>support multi-host.
>
>As detailed below the hosts are connected in the ipmb interface, all host
>related communication is based on ipmb. The openbmc uses ipmbbridged to ma=
nage
>ipmb busses and the ipmb messages are routed to ipmid.
>
>Issue 1: ipmbridged does not support more than 2 channels

ipmbbridged should support as many channels as are specified in the=20
configuration file. A change like this would go in your bbappend in your=20
platform layer.

>Issue 2: ipmid does not have the information on which ipmb channel the req=
uest
>has come from. The ipmid handlers should have the host details to fetch the
>host specific responses.

It has enough information to map it to an IPMI channel and to send it=20
back to the requester.

>2. IPMI and IPMB System architecture:
>--------------------------------------
>       +-----------+       +------------+      +--------+
>       |           |       |            | ipmb1|        |
>       |           |       |            |------| Host-1 |
>       |           |       |            |      |        |
>       |           |       |            |      +--------+
>       |           |       |            |
>       |           |       |            |
>       |           | dbus  |            |      +--------+
>       | ipmid     |-------| Ipmbbridged| ipmb2|        |
>       |           |       |            |------| Host-2 |
>       |           |       |            |      |        |
>       |           |       |            |      +--------+
>       |           |       |            |
>       |           |       |            |
>       |           |       |            |      +--------+
>       |           |       |            | ipmb |        |
>       |           |       |            |------| Host-N |
>       |           |       |            |      |        |
>       +-----------+       +------------+      +--------+
>=09
>Hosts are connected with ipmb interface, the hosts can be 1 to N. The ipmb
>request coming from the hosts are routed to ipmid by the ipmbbridged.
>The ipmd requests are routed from ipmid or any service by d-bus interface =
and
>the ipmbbridged routes to ipmb interface.
>
>3. Proposed Design:
>--------------------
>To address issue1 and issue2, we propose the following design changes in
>ipmbbridged and ipmid.
>
>3.1 Changes in ipmbbridged:
>---------------------------
>The current ipmbbridged supports only 2 channels and this needs to be
>enhanced to more channels.
>ipmbbridged to send the channel details from where the request is received
>
>3.1.1 Change1 : support more than 2 channels
>---------------------------------------------
>To support more than 2 channels, we propose to add additional channels nam=
ed
>"host1", "host2" ..."hostn"
>
>This can be decided by the config file "ipmb-channels.json", The change wi=
ll
>look like below
>
>{
>  "channels": [
>    {
>      "type": "me",
>      "slave-path": "/dev/ipmb-1",
>      "bmc-addr": 32,
>      "remote-addr": 44
>    },
>    {
>      "type": "ipmb",
>      "slave-path": "/dev/ipmb-2",
>      "bmc-addr": 32,
>      "remote-addr": 96
>    }
>	{
>      "type": "host1",

I don't understand why you need to have a new type here. Each of these=20
channels are IPMB channels (according to the IPMI specification)=20

You do need somewhere to mark the ID of the host, but I feel that would=20
be better suited as a new entry
       "host": 1,

>      "slave-path": "/dev/ipmb-3",
>      "bmc-addr": 32,
>      "remote-addr": 64
>    }
>	{
>      "type": "host2",
>      "slave-path": "/dev/ipmb-4",
>      "bmc-addr": 32,
>      "remote-addr": 64
>    }
>	{
>      "type": "host3",
>      "slave-path": "/dev/ipmb-4",
>      "bmc-addr": 32,
>      "remote-addr": 64
>    }
>  ]
>}
>
>Reading the json file ipmbbridged to support host channels optionally.
>
>3.1.2. Change 2: Sending Host detail as addional parameter
>-----------------------------------------------------------
>While routing the ipmb requests coming from the host channel, the ipmbbrid=
ged
>adds the ipmb bus details configured in the json file key "type".
>In the above example the ipmb request coming from "/dev/ipmb-4" the ipmb w=
ill
>send "host2" as optional parameter in the d-bus interface to ipmid.

Better would be a host:2 entry

>3.2 Changes in ipmid:
>---------------------
>Receive the optional parameter sent by the ipmbbriged as host details, whi=
le
>receiving the parameter in the executionEntry method call the same will be
>passed to the command handlers in both common and oem handlers.
>The command handlers can make use of the host information to fetch host
>specific data.

I would suggest that this is a new item in the ipmi::Context class. It=20
should default to 0 (first host), and can be set by by a bridge=20
(ipmbbridged, kcsbridged, etc.).

>For example, host1 send a request to get boot order from bmc, bmc maintains
>data separately for each host. When this command comes to ipmid the comman=
ds
>handler gets the host in which the command received. The handler will fetch
>host1 boot order details and respond from the command handler. This is
>applicable for both common and oem handlers.

It would be up to the handler to behave correctly by checking the=20
ipmi::Context.

--Vernon
