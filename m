Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DD94C9549
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 20:58:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7SjX0QNNz3bvX
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 06:58:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DW0QKe7/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DW0QKe7/; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7SgT1WJBz30KP
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2022 06:56:36 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221IBxFI031843; 
 Tue, 1 Mar 2022 19:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : message-id : content-type : references :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=djUSDiVtUlVaZ4QRckXjZ04HwW8QPaOaAooS2LqjKDA=;
 b=DW0QKe7/hQai/SpgA8/AnOGT45guPmwP9Y/2lJyYx42iPCdrWN/GGzG2IXol+7COwaxk
 RElETS/XLUbgceYbdcv92k4o8d+VOAEi6BLWZ5sZ0WMjlEmpXBQrMgeRFaHrwHHwimKL
 OD6yzvKBT/wNasEvwaYmP9gAsrbZCKtM9yvgGflhw0uIOyo5tDvXWFQEFXw8ojSgvm2U
 T9FhGQ4CJp6Kwld3ZTTFZo2MehJ68/B4C2rhezlArJylpd5IH+1zmoGoh7pgbPLnyVwo
 knGZrien9jlWVGboTqC7qXLpdZn3Ig3wMpVDUah5tbiQQWzsTUYJHoc5OLBWkG0eAqqJ 0A== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehrj2t7vc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 19:56:27 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221JlRqi025588;
 Tue, 1 Mar 2022 19:56:26 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01dal.us.ibm.com with ESMTP id 3efbuaes8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 19:56:26 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 221JuPwF32047456
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 19:56:25 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5196BBE054;
 Tue,  1 Mar 2022 19:56:25 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37CCABE053;
 Tue,  1 Mar 2022 19:56:25 +0000 (GMT)
Received: from mww0332.dal12m.mail.ibm.com (unknown [9.208.69.80])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue,  1 Mar 2022 19:56:25 +0000 (GMT)
In-Reply-To: <3f4f0cc0-7967-66f9-a085-a6b2ae978a01@intel.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "Johnathan Mantey" <johnathanx.mantey@intel.com>
Date: Tue, 1 Mar 2022 19:56:23 +0000
Message-ID: <OF3DD93C9E.F4964E74-ON002587F8.006D8847-002587F8.006D8849@ibm.com>
Content-Type: text/plain; charset=UTF-8
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <3f4f0cc0-7967-66f9-a085-a6b2ae978a01@intel.com>,
 <af9a0274-2fb3-8195-a02b-c1d5ecf4848e@intel.com>
 <bb39999e8f9638da3d29b865d85fb54d51da9797.camel@codeconstruct.com.au>
 <CAGm54UE1bFeLF9PHUuj__E0m_+CxLRtA4Htrjm4y5M3SnbOhLA@mail.gmail.com>
 <37a29642-788c-b966-3b58-214c3d44c8f4@intel.com>
 <64727f8e-cca3-b04d-e4cf-709ceb60f37f@linux.intel.com>
 <YhY7Kxgg6ew0HdUR@heinlein>
 <112c8819-24bc-2a24-45a3-9c919088f43a@linux.intel.com>
X-Mailer: Lotus Domino Web Server Release 11.0.1FP2HF127   December 20, 2021
X-MIMETrack: Serialize by http on MWW0332/03/M/IBM at 03/01/2022 19:56:23,
 Serialize complete at 03/01/2022 19:56:23
X-Disclaimed: 55899
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1-1q3blGmO7KfLT3USopcRojq2UR_t2Q
X-Proofpoint-ORIG-GUID: 1-1q3blGmO7KfLT3USopcRojq2UR_t2Q
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
Subject: RE: Checking for network online
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 clxscore=1011 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203010097
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
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>, OpenBMC
 Maillist <openbmc@lists.ozlabs.org>, Lei Yu <yulei.sh@bytedance.com>,
 Jeremy Kerr <jk@codeconstruct.com.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Feb 23, 2022,  Johnathan Mantey wrote:
>On 2/23/22 09:44, Jiaqing Zhao wrote:
>> On 2022-02-23 21:48, Patrick Williams wrote:
>>> On Wed, Feb 23, 2022 at 10:09:19AM +0800, Jiaqing Zhao wrote:
>>>> I think a solution is to set RequiredForOnline=3Dno
>>>> (https://www.freedesktop.org/software/systemd/man/systemd.network.htm
>>>> l#RequiredForOnline=3D) in all network interface config. This option
>>>> skips the interface when running
>>>> systemd-networkd-wait-online.service. Canonical netplan (used in
>>>> ubuntu server) also uses this option to skip the online check for
>>>> given interface
>>>> (https://github.com/canonical/netplan/blob/main/src/networkd.c#L636-L
>>>> 639).
>>>>
>>>> I'll submit a patch to phosphor-networkd later.
>>>
>>> I really don't think this is appropriate for all systems.
>>> Services have
>>> dependencies on network-online.target for a reason. If the
>>> side-effect of
>>> having the BMC network cable unplugged is that the host doesn't
>>> boot, that might
>>> be entirely reasonable behavior in some environments.
>>>
>>> We use rsyslog as the mechanism to offload our BMC logging data to
>>> an
>>> aggregation point. When you have a very large scale deployment,
>>> it is actually
>>> better for the system to not come online than for us to lose out
>>> on that data,
>>> since we have spare capacity to take its place.
>>
>> My understanding is that in OpenBMC, the propose to use rsyslog is
>> to format the Redfish and IPMI SEL logs from system journal. The "r"
>> of rsyslogd is not used in most cases. I think the "network not
>> available" can be handled same as "server misconfigured" in rsyslogd,
>> as in both cases it fails to connect to the server, and may exit or
>> print some error messages? (not tried yet)
>>
>> Jonathan mentions that the 120s wait blocks multi-user.target in
>> his initial email. Considering that there is no BMC serial port in
>> most production hardware, when BMC has no network connection, the
>> only way to interact with BMC is to use IPMI in host. However, IPMI
>> services are started in multi-user.target, if BMC infinitely waits
>> network online, there would be no way to debug the issue.
>>
>>> Note that the Canonical netplan only applies this option if the
>>> configuration
>>> indicates that the interface is optional, which is entirely
>>> appropriate. The
>>> way you wrote it could have been interpreted that they set this on
>>> *every*
>>> interface, which is what it seems like you're proposing to do to
>>> phosphor-networkd
>>>
>>> If this is desired behavior for someone, can't you supply a
>>> wildcard .network
>>> file that adds this option, rather than modifying
>>> phosphor-networkd to manually
>>> add it to each network interface that it is managing?
>>
>> Maybe we can add a similar DBus property like how netplan does?
>> Reading/writing systemd-networkd config files is feasible in
>> phosphor-networkd. Default value can be assigned via build option.
>>
>>> I believe some designs use a USB network device to connect two
>>> internal pieces
>>> of the system and those interfaces are not necessarily managed by
>>> phosphor-networkd (interfaces that, for example connect BMC-to-BMC
>>> or
>>> BMC-to-Host). While it is obviously up to the system designer to
>>> work through
>>> this bug, by applying this configuration as you proposed you are
>>> causing
>>> unusual default behavior in that networkd is going to start
>>> waiting for these
>>> internal connections to come online instead of the external
>>> interface.
>>
>> I think this is a extremely rare case, internal interfaces should
>> be configurable. For example, host OS can change the IP of its
>> BMC-Host virtual interface, BMC should also be able to change its,
>> and for BMC-to-BMC interfaces, it is impossible to assign a fixed LAN
>> IP without conflicts in manufacturing. The easiest way to configure
>> it is to utilize the phosphor-networkd.
>>
>> Even it is not managed by phosphor-networkd, keeping default
>> RequiredForOnline=3Dyes will cause the 120s wait on BMC boot.
>> Developers can simply search it and find out the solution. I remember
>> it will show a timer with message on BMC serial console, that's how I
>>found I should set the "optional" on my ubuntu server.
>
>FWIW, my experimentation with systemd-networkd-wait-online was not
>successful in doing much to change the 120 second timeout.
>
>Setting the RequiredForOnline entry to false in systemd.network did
>not
>prevent the 120 second timeout from elapsing.
>
>Setting any of the following switches in the service file failed to
>eliminate the timeout:
>--ignore=3Deth0
>--interface=3Deth0:no-carrier # overrides RequiredForOnline
>--interface=3Deth0:no-carrier:no-carrier # <- probably a bad setting in
> # hindsight
>
>It appears systemd-networkd-wait-online expects some state greater
>than
>no-carrier to consider the link online, thus allowing it to exit with
>a
>SUCCESS error code. This even when explicitly instructed no-carrier
>is
>defined as "online".
>
>The only switch that seemed to perform as expected in this instance
>was
>--timeout. Assigning a value less than 120 to the --timeout control
>did
>reduce the wait period. It does assign a SUCCESS error code upon
>timing
>out, which is expected behavior.
>
>systemd-networkd-wait-online appears to have logic preventing
>no-carrier
>state from being assigned as the "network online" value.
>
>rsyslogd has both a network and network-online target. If the
>network-online target is removed then systemd-networkd-wait-online
>doesn't run, and any configuation of that service appears to be
>pointless. The conclusion I have from that is that
>network-online.target
>is a valid configuration option for a service to assign.
>
>There may be openbmc powered servers that do use the distributed
>logging
>provided by rsyslogd. If there are then globally removing
>network-online
>from the rsyslog service file is undesirable. I consider the same to
>be
>true of assigning a default RequiredForOnline=3Dfalse.
>
>Based on the above, it's my opinion this is a vendor based decision
>for
>how to configure rsyslog/systemd-networkd-wait-online.
>


I just wanted to point out that for those using the kernel NCSI stack,=20
the networks are always showing on line and link up because of how=20
the stack was created.  My reading is it would take a new slave=20
interface to overcome this limitation.

Milton
