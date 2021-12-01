Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 717484653CB
	for <lists+openbmc@lfdr.de>; Wed,  1 Dec 2021 18:17:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J45Pq2Dcpz3c7V
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 04:17:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J45PX0203z305F
 for <openbmc@lists.ozlabs.org>; Thu,  2 Dec 2021 04:17:35 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.93])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id EE864CF3BF89;
 Wed,  1 Dec 2021 18:08:05 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 1 Dec
 2021 18:08:05 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00153c410bf-fa04-4e84-9194-5a30c663618b,
 B1B2F16E074A3834E761D78C884096944A10C2DE) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e9f07099-c891-0668-3a39-6d5c95812902@kaod.org>
Date: Wed, 1 Dec 2021 18:08:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Using Qemu for BMC with a TAP interface
Content-Language: en-US
To: Peter Foley <pefoley@google.com>, Patrick Venture <venture@google.com>
References: <CAO=notybTVxHG2LVzW66vfK3232zCON2v5-p8-bpeTYGm3MMxQ@mail.gmail.com>
 <CACPK8XeXG9pnv7nWwCm=1bMNVO2a0y1YGuSohuMhB4Ous9hOFw@mail.gmail.com>
 <73fb026a-e488-cd92-50bb-38aac8616e66@kaod.org>
 <CAO=notx5mq0g0bL0pTfJEn8tgf1bKM=uUi2crR3z_vAvvxCe1w@mail.gmail.com>
 <CAAAKUPMtuVFVXsnbKodCdTF4qicNuci373tD5sKhVm_3qZ6-vQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAAAKUPMtuVFVXsnbKodCdTF4qicNuci373tD5sKhVm_3qZ6-vQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9a5ee580-d709-4484-8db8-ad88af01ff54
X-Ovh-Tracer-Id: 12390809950824401888
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrieefgdeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekleetffehveevvdejjefgudejfeeuleekueejffevfeejieffueegvdetudfhhfenucffohhmrghinheprhgvshgvrghrtghhrdhgohhoghhlvgenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdhorhhg
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

On 12/1/21 16:59, Peter Foley wrote:
> The container system we're using (https://research.google/pubs/pub43438 <https://research.google/pubs/pub43438>) provides a set of FDs connected to a pre-configured TAP device, so I don't think manual bridge configuration is an option.

ok. That's interesting. You are running QEMU BMC machines (Nuvotons and Aspeed ?)
wrapped in containers. Why BMC machines?

I guess we could reproduce the setup with a single instance to check issues but
it's a lot of work for an uncommon scenario.

Thanks,

C.


> 
> On Tue, Nov 30, 2021 at 7:54 PM Patrick Venture <venture@google.com <mailto:venture@google.com>> wrote:
> 
> 
> 
>     On Mon, Nov 22, 2021 at 12:14 AM Cédric Le Goater <clg@kaod.org <mailto:clg@kaod.org>> wrote:
> 
>         Hello,
> 
>         On 11/22/21 08:20, Joel Stanley wrote:
>          > On Thu, 18 Nov 2021 at 20:35, Patrick Venture <venture@google.com <mailto:venture@google.com>> wrote:
>          >>
>          >> Hi;
>          >>
>          >> We're working on wiring up our Qemu BMC via a TAP configuration, and we're not seeing packets inside the Nuvoton NIC itself (a level of debugging we had to enable).  We're using the npcm7xx SoC device,
>          >>
>          >> -nic tap,fds=4:5:6:7:8:9:10:11,id=net0,model=npcm7xx-emc,mac=58:cb:52:18:b8:f7
>          >>
>          >> For the networking parameters, where the tap fds are valid.  I was curious if any of y'all got qemu networking working for your BMC SoCs, either Aspeed or Nuvoton?
>          >
>          > I've not tried using the -nic tap option with file descriptors. It's
>          > not quite clear what you're trying to do, or what your full setup
>          > looks like.
> 
>         yes. could you explain please ? It is simpler to run with a netdev bridge
>         backend :
> 
>             -net nic,macaddr=C0:FF:EE:00:00:03,netdev=net0 -netdev bridge,id=net0,helper=/usr/libexec/qemu-bridge-helper,br=virbr0
> 
> 
>     Thanks for the replies and help.  I don't know why my mail didn't decide this should go in my inbox.  Probably user error on my part in the filters.
> 
>     Peter, would a network bridge simplify life?  I imagine the file descriptor approach is because of the framework configuring Qemu, but wanted to ask.
> 
> 
> 
>         Thanks,
> 
>         C.
> 
>          >
>          > I did test it out just now with a manually created tap interface:
>          >
>          > sudo ip tuntap add test0 mode tap group netdev
>          > sudo ip link set test0 up
>          > sudo tcpdump -i test0
>          >
>          > And then when I fired up a qemu instance,
>          >
>          > qemu-system-arm -nographic -M romulus-bmc -kernel arch/arm/boot/zImage
>          > -dtb arch/arm/boot/dts/aspeed-bmc-opp-romulus.dtb -initrd arm.cpio.xz
>          > -nic tap,ifname=test0,id=net0
>          >
>          > I could see packets being decoded by the tcpdump instance (my laptop
>          > is 'voyager', qemu came up as fe80::5054:ff:fe12:3456):
>          >
>          > $ sudo tcpdump -i test0
>          > tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
>          > listening on test0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
>          > 15:10:32.683930 IP6 voyager > ip6-allrouters: ICMP6, router
>          > solicitation, length 16
>          > 15:10:33.655994 IP6 voyager.mdns > ff02::fb.mdns: 0 [2q] PTR (QM)?
>          > _ipps._tcp.local. PTR (QM)? _ipp._tcp.local. (45)
>          > 15:10:37.795242 IP6 fe80::5054:ff:fe12:3456 > ip6-allrouters: ICMP6,
>          > router solicitation, length 16
>          > 15:11:05.688413 IP6 voyager.mdns > ff02::fb.mdns: 0 [2q] PTR (QM)?
>          > _ipps._tcp.local. PTR (QM)? _ipp._tcp.local. (45)
>          > 15:11:07.499841 IP6 voyager > ip6-allrouters: ICMP6, router
>          > solicitation, length 16
>          > 15:11:11.079030 IP6 fe80::5054:ff:fe12:3456 > ip6-allrouters: ICMP6,
>          > router solicitation, length 16
> 
> 
>     Thanks, so with the ftgmac100 nic, you're able to talk to qemu via tap.  I didn't see any obvious differences in the npcm7xx_emc device.
> 
>          >
>          > I've cc'd Cédric as he is the king of qemu command lines.
>          >
>          > Cheers,
>          >
>          > Joel
>          >
>          >
>          >
>          >
>          >
>          >
>          >>
>          >> Patrick
> 

