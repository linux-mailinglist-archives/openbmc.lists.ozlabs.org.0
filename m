Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D09072529DD
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 11:19:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bc0g95FygzDqMy
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 19:19:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com;
 envelope-from=prvs=050797d1fa=bruno.cornec@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
X-Greylist: delayed 135 seconds by postgrey-1.36 at bilbo;
 Wed, 26 Aug 2020 19:18:42 AEST
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bc0fB0vjdzDqMy
 for <openbmc@lists.ozlabs.org>; Wed, 26 Aug 2020 19:18:40 +1000 (AEST)
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
 by mx0a-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07Q9E047020009; Wed, 26 Aug 2020 09:16:22 GMT
Received: from g4t3427.houston.hpe.com (g4t3427.houston.hpe.com
 [15.241.140.73])
 by mx0a-002e3701.pphosted.com with ESMTP id 334u9utth8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Aug 2020 09:16:21 +0000
Received: from g9t2301.houston.hpecorp.net (g9t2301.houston.hpecorp.net
 [16.220.97.129])
 by g4t3427.houston.hpe.com (Postfix) with ESMTP id 365B65C;
 Wed, 26 Aug 2020 09:16:21 +0000 (UTC)
Received: from morley.fr.hpecorp.net (morley.fr.hpecorp.net [10.39.8.55])
 by g9t2301.houston.hpecorp.net (Postfix) with ESMTP id C88A84D;
 Wed, 26 Aug 2020 09:16:20 +0000 (UTC)
Received: by morley.fr.hpecorp.net (Postfix, from userid 2000)
 id DFD43B68; Wed, 26 Aug 2020 11:16:19 +0200 (CEST)
Date: Wed, 26 Aug 2020 11:16:19 +0200
From: Bruno Cornec <Bruno.Cornec@hpe.com>
To: Mike Jones <proclivis@gmail.com>
Subject: Re: systemd clarification
Message-ID: <20200826091619.GG2172@morley.fr.hpecorp.net>
References: <C255655B-FA25-4CC3-9982-211D71352F74@gmail.com>
 <20200825165258.GT20886@morley.fr.hpecorp.net>
 <B3E8FB77-80E3-4BB0-BFF0-A685403DF9B4@gmail.com>
Content-Type: text/plain; charset=iso-2022-jp; format=flowed
Content-Disposition: inline
In-Reply-To: <B3E8FB77-80E3-4BB0-BFF0-A685403DF9B4@gmail.com>
X-Humor: Linux is to Windows what early music is to military music
X-Operating-System: Linux morley.fr.hpecorp.net 5.3.7-server-4.mga7
X-Current-Uptime: 09:54:42 up 232 days, 14:14, 22 users, load average: 0, 32, 
 0,24, 0,25
X-HP-HOWTO-URL: http://www.HyPer-Linux.org/HP-HOWTO/current
X-URL: http://eurolinux.fr.smktg.hpecorp.net/
X-eurolinux: ftp://eurolinux.fr.smktg.hpecorp.net/pub/linux
X-mondorescue: http://www.mondorescue.org ftp://ftp.mondorescue.org
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Proofpoint-UnRewURL: 4 URL's were un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-26_06:2020-08-25,
 2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008260074
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
 Bruno Cornec <Bruno.Cornec@hpe.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Sorry Mike, I can't really comment on the OpenBMC side, as I'm more a reader here than a contriutor myself. Someone else more accustomed to that will surely give you an answer.

Best regards,
Bruno.

Mike Jones said on Tue, Aug 25, 2020 at 12:03:23PM -0600:

>Bruno,
>
>A related question.
>
>When I look through the services and targets installed when including meta-phosphor, power on/off seems to lead to dead ends, meaning no exe to do the work.
>
>So I looked at meta-facebook, and it adds host-poweron.service, which calls exec power-util…
>
>So it seems to me that meta-phosphor only puts in the infrastructure, and a particular use/design requires adding services to do the actual work of power on/off. This seems logical wrt factoring out behaviors. Is this correct?
>
>This would mean in my cause of use meta-raspberrypi, I need to add the missing pieces if I want power control of my externally connected regulators to get powered on/off.
>
>Mike
>
>> On Aug 25, 2020, at 10:52 AM, Bruno Cornec <Bruno.Cornec@hpe.com> wrote:
>>
>> Hello,
>>
>> /etc/systemd is used to override or add locally units which are not delivered as part of the std systemd delivery which is under /lib/systemd (or /usr/lib/systemd depending on Linux distribuions). It's an easy way to modify a std unit file and change say the options used to start the daemon e.g.
>> So:
>>
>> Mike Jones said on Tue, Aug 25, 2020 at 10:20:54AM -0600:
>>> The lib path is not a search path in the systemd documentation, and the etc path has links into the lib path. So I assume services in the lib path are only run if they are linked into the etc path. Is this correct?
>>
>> No. they are run if they are enabled (systemctl list-units to see that)
>>
>>> If there is a an After= that lists something found only in the lib path, I assume it will run because After is not strong enough to prevent start. But if it was Requires=, then I assume it cannot start unless it is linked into the etc path so that it is available. Is this correct?
>>
>> No. No link is necessary.
>> Best regards,
>> Bruno.
>> --
>> HPE WW FLOSS Technology Strategist      http://www.hpe.com/engage/opensource
>> Open Source Profession, WW Linux Community Lead    http://github.com/bcornec
>> FLOSS projects:     http://mondorescue.org         http://project-builder.org
>> Musique ancienne?   http://www.musique-ancienne.org   http://www.medieval.org

-- 
HPE WW FLOSS Technology Strategist      http://www.hpe.com/engage/opensource
Open Source Profession, WW Linux Community Lead    http://github.com/bcornec
FLOSS projects:     http://mondorescue.org        http://project-builder.org
Musique ancienne?   http://www.musique-ancienne.org  http://www.medieval.org
