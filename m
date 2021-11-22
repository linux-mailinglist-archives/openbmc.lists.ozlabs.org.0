Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E14458AE6
	for <lists+openbmc@lfdr.de>; Mon, 22 Nov 2021 09:53:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HyLdW61Jnz3dwV
	for <lists+openbmc@lfdr.de>; Mon, 22 Nov 2021 19:53:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 1197 seconds by postgrey-1.36 at boromir;
 Mon, 22 Nov 2021 19:52:36 AEDT
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyLd03QMpz3dvD
 for <openbmc@lists.ozlabs.org>; Mon, 22 Nov 2021 19:52:35 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.216])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 1C738CD0D8CE;
 Mon, 22 Nov 2021 09:14:46 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 22 Nov
 2021 09:14:46 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00221c0923f-8ed1-4d4d-8082-cc1e8ee06be1,
 416F395970A38A0BC3BF4248461703C95BA59510) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <73fb026a-e488-cd92-50bb-38aac8616e66@kaod.org>
Date: Mon, 22 Nov 2021 09:14:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Using Qemu for BMC with a TAP interface
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Patrick Venture <venture@google.com>
References: <CAO=notybTVxHG2LVzW66vfK3232zCON2v5-p8-bpeTYGm3MMxQ@mail.gmail.com>
 <CACPK8XeXG9pnv7nWwCm=1bMNVO2a0y1YGuSohuMhB4Ous9hOFw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8XeXG9pnv7nWwCm=1bMNVO2a0y1YGuSohuMhB4Ous9hOFw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 801ac044-6aaa-4509-9982-b228d1d8497e
X-Ovh-Tracer-Id: 5869879166226762720
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrgeefgdduudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehpvghfohhlvgihsehgohhoghhlvgdrtghomh
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Peter Foley <pefoley@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

On 11/22/21 08:20, Joel Stanley wrote:
> On Thu, 18 Nov 2021 at 20:35, Patrick Venture <venture@google.com> wrote:
>>
>> Hi;
>>
>> We're working on wiring up our Qemu BMC via a TAP configuration, and we're not seeing packets inside the Nuvoton NIC itself (a level of debugging we had to enable).  We're using the npcm7xx SoC device,
>>
>> -nic tap,fds=4:5:6:7:8:9:10:11,id=net0,model=npcm7xx-emc,mac=58:cb:52:18:b8:f7
>>
>> For the networking parameters, where the tap fds are valid.  I was curious if any of y'all got qemu networking working for your BMC SoCs, either Aspeed or Nuvoton?
> 
> I've not tried using the -nic tap option with file descriptors. It's
> not quite clear what you're trying to do, or what your full setup
> looks like.

yes. could you explain please ? It is simpler to run with a netdev bridge
backend :

   -net nic,macaddr=C0:FF:EE:00:00:03,netdev=net0 -netdev bridge,id=net0,helper=/usr/libexec/qemu-bridge-helper,br=virbr0


Thanks,

C.

> 
> I did test it out just now with a manually created tap interface:
> 
> sudo ip tuntap add test0 mode tap group netdev
> sudo ip link set test0 up
> sudo tcpdump -i test0
> 
> And then when I fired up a qemu instance,
> 
> qemu-system-arm -nographic -M romulus-bmc -kernel arch/arm/boot/zImage
> -dtb arch/arm/boot/dts/aspeed-bmc-opp-romulus.dtb -initrd arm.cpio.xz
> -nic tap,ifname=test0,id=net0
> 
> I could see packets being decoded by the tcpdump instance (my laptop
> is 'voyager', qemu came up as fe80::5054:ff:fe12:3456):
> 
> $ sudo tcpdump -i test0
> tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
> listening on test0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
> 15:10:32.683930 IP6 voyager > ip6-allrouters: ICMP6, router
> solicitation, length 16
> 15:10:33.655994 IP6 voyager.mdns > ff02::fb.mdns: 0 [2q] PTR (QM)?
> _ipps._tcp.local. PTR (QM)? _ipp._tcp.local. (45)
> 15:10:37.795242 IP6 fe80::5054:ff:fe12:3456 > ip6-allrouters: ICMP6,
> router solicitation, length 16
> 15:11:05.688413 IP6 voyager.mdns > ff02::fb.mdns: 0 [2q] PTR (QM)?
> _ipps._tcp.local. PTR (QM)? _ipp._tcp.local. (45)
> 15:11:07.499841 IP6 voyager > ip6-allrouters: ICMP6, router
> solicitation, length 16
> 15:11:11.079030 IP6 fe80::5054:ff:fe12:3456 > ip6-allrouters: ICMP6,
> router solicitation, length 16
> 
> I've cc'd Cédric as he is the king of qemu command lines.
> 
> Cheers,
> 
> Joel
> 
> 
> 
> 
> 
> 
>>
>> Patrick

