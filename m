Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B586D219CD8
	for <lists+openbmc@lfdr.de>; Thu,  9 Jul 2020 12:03:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2Wvy38pJzDr22
	for <lists+openbmc@lfdr.de>; Thu,  9 Jul 2020 20:03:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gkeishin@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2Wt52Y5mzDqvN
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jul 2020 20:01:42 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0699XTO0175835
 for <openbmc@lists.ozlabs.org>; Thu, 9 Jul 2020 06:01:39 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.93])
 by mx0a-001b2d01.pphosted.com with ESMTP id 325k3rdv12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 09 Jul 2020 06:01:39 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <gkeishin@in.ibm.com>;
 Thu, 9 Jul 2020 10:01:36 -0000
Received: from us1a3-smtp07.a3.dal06.isc4sb.com (10.146.103.14)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 9 Jul 2020 10:01:33 -0000
Received: from us1a3-mail113.a3.dal06.isc4sb.com ([10.146.6.4])
 by us1a3-smtp07.a3.dal06.isc4sb.com
 with ESMTP id 2020070910013309-1308775 ;
 Thu, 9 Jul 2020 10:01:33 +0000 
In-Reply-To: <SG2PR04MB3093BDC2C56A104905AC1114E1640@SG2PR04MB3093.apcprd04.prod.outlook.com>
To: Jayashree D <jayashree-d@hcl.com>
From: "George Keishing" <gkeishin@in.ibm.com>
Date: Thu, 9 Jul 2020 15:31:32 +0530
References: <SG2PR04MB3093BDC2C56A104905AC1114E1640@SG2PR04MB3093.apcprd04.prod.outlook.com>
X-KeepSent: DAFE804A:382B5A53-002585A0:0036EB5A;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 10.0.1 November 29, 2018
X-LLNOutbound: False
X-Disclaimed: 39383
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=8FBB0F33DFA56DCA8f9e8a93df938690918c8FBB0F33DFA56DCA"
x-cbid: 20070910-8889-0000-0000-000003175E0B
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.410717; ST=0; TS=0; UL=0; ISC=; MB=0.240055
X-IBM-SpamModules-Versions: BY=3.00013435; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01403235; UDB=6.00751612; IPR=6.01185517; 
 MB=3.00032922; MTD=3.00000008; XFM=3.00000015; UTC=2020-07-09 10:01:35
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-07-09 07:11:17 - 6.00011579
x-cbparentid: 20070910-8890-0000-0000-0000AC8B993C
Message-Id: <OFDAFE804A.382B5A53-ON002585A0.0036EB5A-652585A0.00371292@notes.na.collabserv.com>
MIME-Version: 1.0
Subject: Re:  Issue about REST API endpoint paths in openbmc-test-automation
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-09_05:2020-07-09,
 2020-07-09 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Velumani
 T-ERS, HCLTech" <velumanit@hcl.com>,
 openbmc <openbmc-bounces+gkeishin=in.ibm.com@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0__=8FBB0F33DFA56DCA8f9e8a93df938690918c8FBB0F33DFA56DCA
Content-type: multipart/alternative; 
	Boundary="1__=8FBB0F33DFA56DCA8f9e8a93df938690918c8FBB0F33DFA56DCA"


--1__=8FBB0F33DFA56DCA8f9e8a93df938690918c8FBB0F33DFA56DCA
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII





From:	Jayashree D <jayashree-d@hcl.com>
To:	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Cc:	"Velumani T-ERS,HCLTech" <velumanit@hcl.com>
Date:	09-07-2020 02:53 PM
Subject:	[EXTERNAL] Issue about REST API endpoint paths in
            openbmc-test-automation
Sent by:	"openbmc" <openbmc-bounces
            +gkeishin=3Din.ibm.com@lists.ozlabs.org>




Hi All,

I am trying to use the test automation for my platform (tiogapass), while
trying I met an issue in "Verify CPU Functional State" which fails because
it shows the list is empty for cpu in the given path.

         ${cpu=5Flist}=3D  Get Endpoint Paths  ${HOST=5FINVENTORY=5FURI}sys=
tem
cpu*
        Should Not Be Empty  ${cpu=5Flist}

When I used curl command to verify the test, I am able to get the data from
the given path.

        [root@odc ~]# curl -k -H "X-Auth-Token: $token" https://$
{bmc}/xyz/openbmc=5Fproject/inventory/system/chassis/motherboard/
        {
          "data": [

"/xyz/openbmc=5Fproject/inventory/system/chassis/motherboard/CPU=5F1",

"/xyz/openbmc=5Fproject/inventory/system/chassis/motherboard/CPU=5F2"
              ],
          "message": "200 OK",
          "status": "ok"
        }

As per my validation, the endpoint path is mentioned as cpu* (lowercase
letters) but in my case the endpoint names are present in uppercase letters
such as CPU=5F1,CPU=5F2.
I am also facing this same issue for some other test cases. Can we have the
search for both CPU and cpu?
Is there any naming convention to be followed in REST api?


Thanks,
Regards,
Jayashree




::DISCLAIMER::
The contents of this e-mail and any attachment(s) are confidential and
intended for the named recipient(s) only. E-mail transmission is not
guaranteed to be secure or error-free as information could be intercepted,
corrupted, lost, destroyed, arrive late or incomplete, or may contain
viruses in transmission. The e mail and its contents (with or without
referred errors) shall therefore not attach any liability on the originator
or HCL or its affiliates. Views or opinions, if any, presented in this
email are solely those of the author and may not necessarily reflect the
views or opinions of HCL or its affiliates. Any form of reproduction,
dissemination, copying, disclosure, modification, distribution and / or
publication of this message without the prior written consent of authorized
representative of HCL is strictly prohibited. If you have received this
email in error please delete it and notify the sender immediately. Before
opening any email and/or attachments, please check them for viruses and
other defects.
-----------------------------------------------------------

Thanks Jayashree for the input,

I have added a regex pattern directive to search both lower and upper case
end points.

 ${resp}=3D  Get Matches  ${list}  regexp=3D^.*[0-9a-z=5F].${endpoint}\[0-9=
a-z]*$

 To

 ${resp}=3D  Get Matches  ${list}  regexp=3D^.*[0-9a-z=5F].${endpoint}\[0-9=
a-z]*$
case=5Finsensitive=3D${True}

 Commit:
https://gerrit.openbmc-project.xyz/#/c/openbmc/openbmc-test-automation/+/34=
519/





Take a look and see if that works for you.


Regards


George  Keishing






--1__=8FBB0F33DFA56DCA8f9e8a93df938690918c8FBB0F33DFA56DCA
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 1 URL was un-rewritten

<html><body><p><img width=3D"16" height=3D"16" src=3D"cid:1__=3D8FBB0F33DFA=
56DCA8f9e8a93df938690918c8FB@" border=3D"0" alt=3D"Inactive hide details fo=
r Jayashree D ---09-07-2020 02:53:26 PM---Hi All, I am trying to use the te=
st automation for my platfor"><font size=3D"2" color=3D"#424282">Jayashree =
D ---09-07-2020 02:53:26 PM---Hi All, I am trying to use the test automatio=
n for my platform (tiogapass), while trying I met an is</font><br><br><font=
 size=3D"2" color=3D"#5F5F5F">From:        </font><font size=3D"2">Jayashre=
e D &lt;jayashree-d@hcl.com&gt;</font><br><font size=3D"2" color=3D"#5F5F5F=
">To:        </font><font size=3D"2">&quot;openbmc@lists.ozlabs.org&quot; &=
lt;openbmc@lists.ozlabs.org&gt;</font><br><font size=3D"2" color=3D"#5F5F5F=
">Cc:        </font><font size=3D"2">&quot;Velumani T-ERS,HCLTech&quot; &lt=
;velumanit@hcl.com&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">Date:  =
      </font><font size=3D"2">09-07-2020 02:53 PM</font><br><font size=3D"2=
" color=3D"#5F5F5F">Subject:        </font><font size=3D"2">[EXTERNAL] Issu=
e about REST API endpoint paths in openbmc-test-automation</font><br><font =
size=3D"2" color=3D"#5F5F5F">Sent by:        </font><font size=3D"2">&quot;=
openbmc&quot; &lt;openbmc-bounces+gkeishin=3Din.ibm.com@lists.ozlabs.org&gt=
;</font><br><hr width=3D"100%" size=3D"2" align=3D"left" noshade style=3D"c=
olor:#8091A5; "><br><br><br><font face=3D"Calibri"> </font><br><font face=
=3D"Calibri">Hi All,</font><br><font face=3D"Calibri"> </font><br><font fac=
e=3D"Segoe UI">I am trying to use the test automation for my platform (tiog=
apass), while trying I met an issue in &quot;Verify CPU Functional State&qu=
ot; which fails because it shows the list is empty for cpu in the given pat=
h.</font><br><font face=3D"Segoe UI"> </font><br><font face=3D"Segoe UI">  =
       ${cpu_list}=3D  Get Endpoint Paths  ${HOST_INVENTORY_URI}system  cpu=
*<br>        Should Not Be Empty  ${cpu_list}</font><br><font face=3D"Segoe=
 UI"> </font><br><font face=3D"Segoe UI">When I used curl command to verify=
 the test, I am able to get the data from the given path.</font><br><font f=
ace=3D"Segoe UI"> </font><br><font face=3D"Segoe UI">        [root@odc ~]# =
curl -k -H &quot;X-Auth-Token: $token&quot; </font><a href=3D"https://$%7Bb=
mc%7D/xyz/openbmc_project/inventory/system/chassis/motherboard/"><u><font c=
olor=3D"#0563C1" face=3D"Segoe UI">https://${bmc}/xyz/openbmc_project/inven=
tory/system/chassis/motherboard/</font></u></a><font face=3D"Segoe UI"><br>=
        {<br>          &quot;data&quot;: [<br>                &quot;/xyz/op=
enbmc_project/inventory/system/chassis/motherboard/CPU_1&quot;,<br>        =
        &quot;/xyz/openbmc_project/inventory/system/chassis/motherboard/CPU=
_2&quot;<br>              ],<br>          &quot;message&quot;: &quot;200 OK=
&quot;,<br>          &quot;status&quot;: &quot;ok&quot;<br>        }</font>=
<br><font face=3D"Segoe UI"> </font><br><font face=3D"Segoe UI">As per my v=
alidation, the endpoint path is mentioned as cpu* (lowercase letters) but i=
n my case the endpoint names are present in uppercase letters such as CPU_1=
,CPU_2.<br>I am also facing this same issue for some other test cases. Can =
we have the search for both CPU and cpu?</font><br><font face=3D"Segoe UI">=
Is there any naming convention to be followed in REST api?</font><br><font =
face=3D"Segoe UI"> </font><br><font face=3D"Segoe UI"> </font><br><font fac=
e=3D"Segoe UI">Thanks,</font><br><font face=3D"Segoe UI">Regards,</font><br=
><font face=3D"Segoe UI">Jayashree</font><br><font face=3D"Segoe UI"> </fon=
t><br><font face=3D"Calibri"> </font><p><font size=3D"1" color=3D"#808080" =
face=3D"Arial">::DISCLAIMER::<br></font><hr width=3D"100%" size=3D"2" align=
=3D"left"><font size=3D"1" color=3D"#808080" face=3D"Arial">The contents of=
 this e-mail and any attachment(s) are confidential and intended for the na=
med recipient(s) only. E-mail transmission is not guaranteed to be secure o=
r error-free as information could be intercepted, corrupted, lost, destroye=
d, arrive late or incomplete, or may contain viruses in transmission. The e=
 mail and its contents (with or without referred errors) shall therefore no=
t attach any liability on the originator or HCL or its affiliates. Views or=
 opinions, if any, presented in this email are solely those of the author a=
nd may not necessarily reflect the views or opinions of HCL or its affiliat=
es. Any form of reproduction, dissemination, copying, disclosure, modificat=
ion, distribution and / or publication of this message without the prior wr=
itten consent of authorized representative of HCL is strictly prohibited. I=
f you have received this email in error please delete it and notify the sen=
der immediately. Before opening any email and/or attachments, please check =
them for viruses and other defects.<br></font><hr width=3D"100%" size=3D"2"=
 align=3D"left"><font size=3D"2">------------------------------------------=
-----------------</font><br><br><font size=3D"2">Thanks Jayashree for the i=
nput,</font><br><br><font size=3D"2">I have added a regex pattern directive=
 to search both lower and upper case end points.</font><br><br><i><font siz=
e=3D"2"> ${resp}=3D  Get Matches  ${list}  regexp=3D^.*[0-9a-z_].${endpoint=
}\[0-9a-z]*$</font></i><br><font size=3D"2"> </font><br><font size=3D"2"> T=
o</font><br><font size=3D"2"> </font><br><font size=3D"2"> </font><i><font =
size=3D"2">${resp}=3D  Get Matches  ${list}  regexp=3D^.*[0-9a-z_].${endpoi=
nt}\[0-9a-z]*$  case_insensitive=3D${True}</font></i><br><font size=3D"2"> =
</font><br><font size=3D"2"> Commit: </font><a href=3D"https://gerrit.openb=
mc-project.xyz/#/c/openbmc/openbmc-test-automation/+/34519/"><font size=3D"=
2">https://gerrit.openbmc-project.xyz/#/c/openbmc/openbmc-test-automation/+=
/34519/</font></a><p><p><font size=3D"2">Take a look and see if that works =
for you.</font><p><font size=3D"2">Regards</font><p><font size=3D"2">George=
  Keishing</font><p><p><BR>
</body></html>

--1__=8FBB0F33DFA56DCA8f9e8a93df938690918c8FBB0F33DFA56DCA--


--0__=8FBB0F33DFA56DCA8f9e8a93df938690918c8FBB0F33DFA56DCA
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=8FBB0F33DFA56DCA8f9e8a93df938690918c8FB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=8FBB0F33DFA56DCA8f9e8a93df938690918c8FBB0F33DFA56DCA--

