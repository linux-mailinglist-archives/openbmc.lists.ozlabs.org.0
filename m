Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 860779320DB
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 09:01:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNVMy3SRpz3cRd
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 17:01:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNVMX74WVz3cRd
	for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2024 17:00:40 +1000 (AEST)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4WNVMW4qw4z4wc4;
	Tue, 16 Jul 2024 17:00:39 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WNVMV3TK8z4wbh;
	Tue, 16 Jul 2024 17:00:38 +1000 (AEST)
Message-ID: <759d187d-fb4a-4fcc-a4b7-a26bd5236179@kaod.org>
Date: Tue, 16 Jul 2024 09:00:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: palmetto-SDR.bin for qemu ipmi-bmc-sim,sdrfile=
To: "Ho, Tong" <tong.ho@amd.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <BL0PR12MB4882D5B995C2EA75D85D6E98E6A22@BL0PR12MB4882.namprd12.prod.outlook.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <BL0PR12MB4882D5B995C2EA75D85D6E98E6A22@BL0PR12MB4882.namprd12.prod.outlook.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

On 7/16/24 08:04, Ho, Tong wrote:
> Hi Cédric,
> 
> Do you know of a tool to generate a file like http://www.kaod.org/qemu/powernv/palmetto-SDR.bin <http://www.kaod.org/qemu/powernv/palmetto-SDR.bin>
> for given to QEMU's ipmi-bmc-sim device via the 'sdrfile' property?

Sorry, I don't. In case you are looking for one, I have been keeping
files here :

   https://www.kaod.org/qemu/powernv/


Thanks,

C.



  
> I tried https://github.com/wrouesnel/openipmi/blob/master/lanserv/sdrcomp/sdrcomp.c <https://github.com/wrouesnel/openipmi/blob/master/lanserv/sdrcomp/sdrcomp.c>,
> which outputs a text file that bears no resemblance to palmetto-SDR.bin.
> 
> Thanks in advance,
> Tong Ho
> 

