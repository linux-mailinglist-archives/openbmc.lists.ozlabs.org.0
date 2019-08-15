Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3D38F0F1
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 18:40:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468XHv0D3GzDr8t
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 02:40:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=miltonm@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468XGh1CkgzDr7M
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 02:39:23 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7FGbDxs142816
 for <openbmc@lists.ozlabs.org>; Thu, 15 Aug 2019 12:39:14 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.67])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ud9xgay5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 15 Aug 2019 12:39:14 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 15 Aug 2019 16:39:10 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 15 Aug 2019 16:39:05 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2019081516390515-576310 ;
 Thu, 15 Aug 2019 16:39:05 +0000 
In-Reply-To: <CF903FDC-3D9E-4FB9-8A3E-34ABB5BDD6B8@fb.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Wilfred Smith <wilfredsmith@fb.com>
Date: Thu, 15 Aug 2019 16:39:05 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CF903FDC-3D9E-4FB9-8A3E-34ABB5BDD6B8@fb.com>,
 <FB0EDEFC-F92E-4F6E-B6BC-B0C5E7AD6E73@fb.com>
 <CAJoAoZm9QpFgRdCsxoaNuCu1YONm_CFUp1fhdFj+h5uZhuCzAw@mail.gmail.com>
X-Mailer: IBM iNotes ($HaikuForm 1054) | IBM Domino Build
 SCN1812108_20180501T0841_FP55 May 22, 2019 at 11:09
X-LLNOutbound: False
X-Disclaimed: 29271
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 19081516-7279-0000-0000-0000003ACD6C
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.440876; ST=0; TS=0; UL=0; ISC=; MB=0.001107
X-IBM-SpamModules-Versions: BY=3.00011593; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01247245; UDB=6.00658246; IPR=6.01028753; 
 MB=3.00028186; MTD=3.00000008; XFM=3.00000015; UTC=2019-08-15 16:39:09
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-08-15 10:44:44 - 6.00010288
x-cbparentid: 19081516-7280-0000-0000-00000058FAA0
Message-Id: <OF838F4B69.A8C14781-ON00258457.005B6C1A-00258457.005B781B@notes.na.collabserv.com>
Subject: RE: Historical Sensor Information
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-15_06:, , signatures=0
X-Proofpoint-Spam-Reason: safe
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
Cc: Emily Shaffer <emilyshaffer@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On August 15, 2019, Wilfred Smith wrote:
>I=E2=80=99ll need to check with my compatriots here at Facebook for our
>specific use cases.
>
>Can you point me to the discussion on metrics reporting?
>

Probably this thread here, there seems to be a working group with a meeting=
 schedule:

https://lists.ozlabs.org/pipermail/openbmc/2019-August/017412.html

Platform telemetry and health monitoring - PST AM=20

https://github.com/openbmc/openbmc/wiki/Platform-telemetry-and-health-monit=
oring-Work-Group

>
>> On Aug 14, 2019, at 7:51 PM, Emily Shaffer
><emilyshaffer@google.com> wrote:
>>=20
>> On Wed, Aug 14, 2019 at 4:05 PM Wilfred Smith <wilfredsmith@fb.com>
>wrote:
>>>=20
>>> I presume most vendors desire the ability to query historical
>sensor information from the BMC.
>>>        Has this feature been implemented already? If so, please
>direct me.
>>>        If not, has someone already begun development?
>>>        Is there an existing specification or write-up?
>>>        Any =E2=80=98druthers or preferences on how I might proceed such
>that my effort benefits the wider community?
>>>=20
>>> Wilfred
>>=20
>> I think that the space constriction on many BMCs has left folks to
>> instead query over IPMI/Redfish and compile historical information
>> elsewhere. Can you tell a little more about the use case and
>indicate
>> why you would rather save history on the BMC than off the BMC?
>>=20
>> A related topic which - as I recall - was discussed and never
>> implemented is the topic of metrics reporting. It's possible that
>the
>> community has moved further on these topics than I remember,
>though,
>> as I've been fairly out of the loop lately.
>> - Emily
>
>

