Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D522B9003
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 11:23:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcG3V3VT4zDqfY
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 21:23:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gkeishin@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=in.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=miKPz47S; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcG2R5PdMzDqlB
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 21:22:19 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AJA3bhI083245
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 05:22:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : to : cc :
 from : date : references : content-type : message-id : mime-version :
 subject; s=pp1; bh=xvzFhrFN/XEftZa+rBMyRDAL8OV46Z91H3gjzr0KNls=;
 b=miKPz47SzM+JF8wfcABch7M/Ckw7tFeTZ2/2pWlwoH+fPZqa02JBRH3FlIvU7BsLgO/k
 IkYRdxQI2MTEOLYU9hCdAazk+PEPCTp0OwRIKEHTXacY4qzusWex/m2XTmqVVxc6qnPz
 yEd1Zyp8Mo3anN4SRGgrjJz3RlbfO+XnPcs97x59giOuCyA7yX5TBuHMSECAzb/w6hSs
 1DKYdZF5p5Mk7ZXABahva0OlMwXBcJcQ/KK4kBgCrYcKdOAFtg5qxUkEOp3NvwXAlXw8
 QqK1AZ1e20H5tdY0nxOKGcHCRk61TWjX0qC9+YXmqtfWgFuess2OYg8Hz4WoN4PEKfbb tQ== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34w4xqfrva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 05:22:17 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <gkeishin@in.ibm.com>;
 Thu, 19 Nov 2020 10:22:16 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 19 Nov 2020 10:22:15 -0000
Received: from us1a3-mail113.a3.dal06.isc4sb.com ([10.146.6.4])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2020111910221505-223035 ;
 Thu, 19 Nov 2020 10:22:15 +0000 
In-Reply-To: <HK0PR03MB509032688E3421C233CE7A2ECFE00@HK0PR03MB5090.apcprd03.prod.outlook.com>
To: CS20 CHLi30 <CHLI30@nuvoton.com>
From: "George Keishing" <gkeishin@in.ibm.com>
Date: Thu, 19 Nov 2020 15:52:10 +0530
References: <HK0PR03MB50904A3601BA9AC1A0F9BC0FCFE00@HK0PR03MB5090.apcprd03.prod.outlook.com>
 <b9c6f22a5a0f0054f864ebcc2fb281ec@linux.vnet.ibm.com>
 <HK0PR03MB509032688E3421C233CE7A2ECFE00@HK0PR03MB5090.apcprd03.prod.outlook.com>
X-KeepSent: C573196F:EFE47F8E-00258625:00385FDE;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 10.0.1 November 29, 2018
X-LLNOutbound: False
X-Disclaimed: 8179
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=8FBB0CB6DFABD94E8f9e8a93df938690918c8FBB0CB6DFABD94E"
x-cbid: 20111910-1335-0000-0000-0000056D0143
X-IBM-SpamModules-Scores: BY=0.228468; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.410717; ST=0; TS=0; UL=0; ISC=; MB=0.055699
X-IBM-SpamModules-Versions: BY=3.00014215; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01465982; UDB=6.00789158; IPR=6.01248620; 
 MB=3.00035114; MTD=3.00000008; XFM=3.00000015; UTC=2020-11-19 10:22:16
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-11-19 08:19:38 - 6.00012071
x-cbparentid: 20111910-1336-0000-0000-000040BB011F
Message-Id: <OFC573196F.EFE47F8E-ON00258625.00385FDE-65258625.0038F620@notes.na.collabserv.com>
X-Proofpoint-UnRewURL: 4 URL's were un-rewritten
MIME-Version: 1.0
Subject: RE: [Test Automation] [Update Service] Failed: Test Firmware Tftp
 Upload Image.Install Same Image Two Times
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-19_05:2020-11-17,
 2020-11-19 signatures=0
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "anoo@us.ibm.com" <anoo@us.ibm.com>,
 openbmc <openbmc-bounces+gkeishin=in.ibm.com@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0__=8FBB0CB6DFABD94E8f9e8a93df938690918c8FBB0CB6DFABD94E
Content-type: multipart/alternative; 
	Boundary="1__=8FBB0CB6DFABD94E8f9e8a93df938690918c8FBB0CB6DFABD94E"


--1__=8FBB0CB6DFABD94E8f9e8a93df938690918c8FBB0CB6DFABD94E
Content-type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable


Hi Tim,

    ${image_id}=3D  Wait Until Keyword Succeeds  180 sec  10 sec  Get Latest
Image ID
    Rprint Vars  image_id


           It looks like the image didn't get downloaded / transferred from
the TFTP server to BMC  /tmp/images/  within 3 minutes 10 seconds.  If the
TFTP server is slower or take longer time, it could lead to this failure.

           It worked when I tried, but hey its been sometime since, we will
try again and see if it working or not on the latest upstream master image.

Thanks and Regards,
   George Keishing




From:	CS20 CHLi30 <CHLI30@nuvoton.com>
To:	Adriana Kobylak <anoo@linux.ibm.com>
Cc:	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
            "anoo@us.ibm.com" <anoo@us.ibm.com>, CS20 CHLi30
            <CHLI30@nuvoton.com>
Date:	19-11-2020 12:38 PM
Subject:	[EXTERNAL] RE: [Test Automation] [Update Sevice] Failed: Test
            Firmware Tftp Upload Image.Install Same Image Two Times
Sent by:	"openbmc" <openbmc-bounces
            +gkeishin=3Din.ibm.com@lists.ozlabs.org>



Hi Adriana,

Thanks your prompt response. You can check more detail from the robot
script:
https://github.com/openbmc/openbmc-test-automation/blob/master/redfish/upda=
te_service/test_firmware_tftp_upload_image.robot


Test failed at Get Latest Image ID return false, due to /tmp/images/$
{image_id} didn't exist.
Below are failed log and test script for you refer it. If there is any
question, just let me know. Thank you.

[Failed log]
Keyword 'Get Latest Image ID' failed after retrying...
The last error was: **ERROR** Invalid variable value: image_id: <blank>
<str>

[Test script]
Same Firmware Install Two Times
    [Documentation]  Download same image twice to BMC via ImageURI. Second
attempt would fail.
    [Arguments]  ${apply_time}  ${tftp_server}=3D${TFTP_SERVER}  $
{image_file_name}=3D${IMAGE_FILE_NAME}

    # Description of argument(s):
    # apply_time       ApplyTime allowed values (e.g. "OnReset",
"Immediate").
    # tftp_server      Server IP.
    # image_file_name  Image file name.

    ImageURI Download Install  ${apply_time}

    # Download image from TFTP server via ImageURI to BMC.

Redfish.Post  /redfish/v1/UpdateService/Actions/UpdateService.SimpleUpdate
    ...  body=3D{"ImageURI": "tftp://${tftp_server}/${image_file_name}"}

    ${image_version}=3D  Get Image Version From TFTP Server  ${tftp_server}
${image_file_name}
    ${software_inventory_record}=3D  Get Software Inventory State By Version
    ...  ${image_version}
    Rprint Vars  software_inventory_record

    ${image_id}=3D  Wait Until Keyword Succeeds  180 sec  10 sec  Get Latest
Image ID
    Rprint Vars  image_id

    Check Image Update Progress State  match_state=3D'Enabled'  image_id=3D$
{image_id}
    # Check if the existing firmware is functional.
    Pass Execution If  ${software_inventory_record['functional']}
    ...  The existing ${image_version} firmware is already functional.

Get Latest Image ID
    [Documentation]  Return the ID of the most recently extracted image.
    # Note: This keyword will fail if there is no such file.

    # Example: # ls /tmp/images/
    #            1b714fb7
    ${image_id}=3D  Get Latest File  /tmp/images/
    Valid Value  image_id

    # Though an image sub-directory was found, it really isn't valid unless
    # the MANIFEST file is present.
    BMC Execute Command  ls -l /tmp/images/${image_id}/MANIFEST

    [Return]  ${image_id}

Best regards,
Tim
-----Original Message-----
From: Adriana Kobylak [mailto:anoo@linux.ibm.com]
Sent: Thursday, November 19, 2020 11:40 AM
To: CS20 CHLi30 <CHLI30@nuvoton.com>
Cc: anoo@us.ibm.com; openbmc@lists.ozlabs.org
Subject: Re: [Test Automation] [Update Sevice] Failed: Test Firmware Tftp
Upload Image.Install Same Image Two Times

On 2020-11-18 19:51, CS20 CHLi30 wrote:
>
> Recently, we met 1 test item fail "Test Firmware Tftp Upload
> Image.Install Same Image Two Times" in Update Service of OpenBMC Test
> Automation.

> According your commit, I understand this is a good fix to clear no use
> image files in /tmp folder.
>
> But, it seems against test item of update service in openbmc test
> automation.
>
> The test script will check if the existing firmware is functional
> according image_id in /tmp folder, if existing then it's not allow to
> update same image two times.
>
> However, after your commit then test script will fail due to image_id
> dir be deleted. Did you have any suggestion for this symptom?

Hi Tim,

Could you provide a bit more details about this test case, you hint that it
may exist in the openbmc-test-automation repo?

The openbmc-test-automation handles this scenario by extracting the
MANIFEST file out of the code update tarball before the upload and reading
the VERSION string, then comparing that with the VERSION in
the /etc/os-release file in the BMC to determine if the version is already
running in the BMC.

I wouldn't recommend trying to generate the id from within the test case
because the algorithm may change. So hopefully checking the version string
is an alternative that'd work.
________________________________
________________________________
 The privileged confidential information contained in this email is
intended for use only by the addressees as indicated by the original sender
of this email. If you are not the addressee indicated in this email or are
not responsible for delivery of the email to such a person, please kindly
reply to the sender indicating this fact and delete all copies of it from
your computer and network server immediately. Your cooperation is highly
appreciated. It is advised that any unauthorized use of confidential
information of Nuvoton is strictly prohibited; and any information in this
email irrelevant to the official business of Nuvoton shall be deemed as
neither given nor endorsed by Nuvoton.




--1__=8FBB0CB6DFABD94E8f9e8a93df938690918c8FBB0CB6DFABD94E
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

<html><body><p><tt><font size=3D"2">Hi Tim,</font></tt><br><br><tt><font si=
ze=3D"2">&nbsp; &nbsp; ${image_id}=3D &nbsp;Wait Until Keyword Succeeds &nb=
sp;180 sec &nbsp;10 sec &nbsp;Get Latest Image ID<br> &nbsp; &nbsp;Rprint V=
ars &nbsp;image_id<br></font></tt><br><br><font size=3D"2">           It lo=
oks like the image didn't get downloaded / transferred from the TFTP server=
 to BMC  /tmp/images/  within 3 minutes 10 seconds.  If the TFTP server is =
slower or take longer time, it could lead to this failure.</font><br><font =
size=3D"2">           </font><br><font size=3D"2">           It worked when=
 I tried, but hey its been sometime since, we will try again and see if it =
working or not on the latest upstream master image.</font><br><br><b><font =
size=3D"2" color=3D"#0000FF">Thanks and Regards,</font></b><br><font size=
=3D"2" color=3D"#0000FF">   George Keishing</font><br><br><br><img width=3D=
"16" height=3D"16" src=3D"cid:1__=3D8FBB0CB6DFABD94E8f9e8a93df938690918c8FB=
@" border=3D"0" alt=3D"Inactive hide details for CS20 CHLi30 ---19-11-2020 =
12:38:59 PM---Hi Adriana, Thanks your prompt response. You can check more d=
"><font size=3D"2" color=3D"#424282">CS20 CHLi30 ---19-11-2020 12:38:59 PM-=
--Hi Adriana, Thanks your prompt response. You can check more detail from t=
he robot script:</font><br><br><font size=3D"2" color=3D"#5F5F5F">From:    =
    </font><font size=3D"2">CS20 CHLi30 &lt;CHLI30@nuvoton.com&gt;</font><b=
r><font size=3D"2" color=3D"#5F5F5F">To:        </font><font size=3D"2">Adr=
iana Kobylak &lt;anoo@linux.ibm.com&gt;</font><br><font size=3D"2" color=3D=
"#5F5F5F">Cc:        </font><font size=3D"2">&quot;openbmc@lists.ozlabs.org=
&quot; &lt;openbmc@lists.ozlabs.org&gt;, &quot;anoo@us.ibm.com&quot; &lt;an=
oo@us.ibm.com&gt;, CS20 CHLi30 &lt;CHLI30@nuvoton.com&gt;</font><br><font s=
ize=3D"2" color=3D"#5F5F5F">Date:        </font><font size=3D"2">19-11-2020=
 12:38 PM</font><br><font size=3D"2" color=3D"#5F5F5F">Subject:        </fo=
nt><font size=3D"2">[EXTERNAL] RE: [Test Automation] [Update Sevice] Failed=
: Test Firmware Tftp Upload Image.Install Same Image Two Times</font><br><f=
ont size=3D"2" color=3D"#5F5F5F">Sent by:        </font><font size=3D"2">&q=
uot;openbmc&quot; &lt;openbmc-bounces+gkeishin=3Din.ibm.com@lists.ozlabs.or=
g&gt;</font><br><hr width=3D"100%" size=3D"2" align=3D"left" noshade style=
=3D"color:#8091A5; "><br><br><br><tt><font size=3D"2">Hi Adriana,<br><br>Th=
anks your prompt response. You can check more detail from the robot script:=
<br></font></tt><tt><font size=3D"2"><a href=3D"https://github.com/openbmc/=
openbmc-test-automation/blob/master/redfish/update_service/test_firmware_tf=
tp_upload_image.robot">https://github.com/openbmc/openbmc-test-automation/b=
lob/master/redfish/update_service/test_firmware_tftp_upload_image.robot</a>=
</font></tt><tt><font size=3D"2">&nbsp;<br><br>Test failed at Get Latest Im=
age ID return false, due to /tmp/images/${image_id} didn't exist.<br>Below =
are failed log and test script for you refer it. If there is any question, =
just let me know. Thank you.<br><br>[Failed log]<br>Keyword 'Get Latest Ima=
ge ID' failed after retrying...<br>The last error was: **ERROR** Invalid va=
riable value: image_id: &lt;blank&gt; &lt;str&gt;<br><br>[Test script]<br>S=
ame Firmware Install Two Times<br> &nbsp; &nbsp;[Documentation] &nbsp;Downl=
oad same image twice to BMC via ImageURI. Second attempt would fail.<br> &n=
bsp; &nbsp;[Arguments] &nbsp;${apply_time} &nbsp;${tftp_server}=3D${TFTP_SE=
RVER} &nbsp;${image_file_name}=3D${IMAGE_FILE_NAME}<br><br> &nbsp; &nbsp;# =
Description of argument(s):<br> &nbsp; &nbsp;# apply_time &nbsp; &nbsp; &nb=
sp; ApplyTime allowed values (e.g. &quot;OnReset&quot;, &quot;Immediate&quo=
t;).<br> &nbsp; &nbsp;# tftp_server &nbsp; &nbsp; &nbsp;Server IP.<br> &nbs=
p; &nbsp;# image_file_name &nbsp;Image file name.<br><br> &nbsp; &nbsp;Imag=
eURI Download Install &nbsp;${apply_time}<br><br> &nbsp; &nbsp;# Download i=
mage from TFTP server via ImageURI to BMC.<br> &nbsp; &nbsp;Redfish.Post &n=
bsp;/redfish/v1/UpdateService/Actions/UpdateService.SimpleUpdate<br> &nbsp;=
 &nbsp;... &nbsp;body=3D{&quot;ImageURI&quot;: &quot;t</font></tt><tt><font=
 size=3D"2">ftp://$</font></tt><tt><font size=3D"2">{tftp_server}/${image_f=
ile_name}&quot;}<br><br> &nbsp; &nbsp;${image_version}=3D &nbsp;Get Image V=
ersion From TFTP Server &nbsp;${tftp_server} &nbsp;${image_file_name}<br> &=
nbsp; &nbsp;${software_inventory_record}=3D &nbsp;Get Software Inventory St=
ate By Version<br> &nbsp; &nbsp;... &nbsp;${image_version}<br> &nbsp; &nbsp=
;Rprint Vars &nbsp;software_inventory_record<br><br> &nbsp; &nbsp;${image_i=
d}=3D &nbsp;Wait Until Keyword Succeeds &nbsp;180 sec &nbsp;10 sec &nbsp;Ge=
t Latest Image ID<br> &nbsp; &nbsp;Rprint Vars &nbsp;image_id<br><br> &nbsp=
; &nbsp;Check Image Update Progress State &nbsp;match_state=3D'Enabled' &nb=
sp;image_id=3D${image_id}<br> &nbsp; &nbsp;# Check if the existing firmware=
 is functional.<br> &nbsp; &nbsp;Pass Execution If &nbsp;${software_invento=
ry_record['functional']}<br> &nbsp; &nbsp;... &nbsp;The existing ${image_ve=
rsion} firmware is already functional.<br><br>Get Latest Image ID<br> &nbsp=
; &nbsp;[Documentation] &nbsp;Return the ID of the most recently extracted =
image.<br> &nbsp; &nbsp;# Note: This keyword will fail if there is no such =
file.<br><br> &nbsp; &nbsp;# Example: # ls /tmp/images/<br> &nbsp; &nbsp;# =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1b714fb7<br> &nbsp; &nbsp;${image_=
id}=3D &nbsp;Get Latest File &nbsp;/tmp/images/<br> &nbsp; &nbsp;Valid Valu=
e &nbsp;image_id<br><br> &nbsp; &nbsp;# Though an image sub-directory was f=
ound, it really isn't valid unless<br> &nbsp; &nbsp;# the MANIFEST file is =
present.<br> &nbsp; &nbsp;BMC Execute Command &nbsp;ls -l /tmp/images/${ima=
ge_id}/MANIFEST<br><br> &nbsp; &nbsp;[Return] &nbsp;${image_id}<br><br>Best=
 regards,<br>Tim<br>-----Original Message-----<br>From: Adriana Kobylak [</=
font></tt><tt><font size=3D"2"><a href=3D"mailto:anoo@linux.ibm.com">mailto=
:anoo@linux.ibm.com</a></font></tt><tt><font size=3D"2">]<br>Sent: Thursday=
, November 19, 2020 11:40 AM<br>To: CS20 CHLi30 &lt;CHLI30@nuvoton.com&gt;<=
br>Cc: anoo@us.ibm.com; openbmc@lists.ozlabs.org<br>Subject: Re: [Test Auto=
mation] [Update Sevice] Failed: Test Firmware Tftp Upload Image.Install Sam=
e Image Two Times<br><br>On 2020-11-18 19:51, CS20 CHLi30 wrote:<br>&gt;<br=
>&gt; Recently, we met 1 test item fail &quot;Test Firmware Tftp Upload<br>=
&gt; Image.Install Same Image Two Times&quot; in Update Service of OpenBMC =
Test<br>&gt; Automation.<br><br>&gt; According your commit, I understand th=
is is a good fix to clear no use<br>&gt; image files in /tmp folder.<br>&gt=
;<br>&gt; But, it seems against test item of update service in openbmc test=
<br>&gt; automation.<br>&gt;<br>&gt; The test script will check if the exis=
ting firmware is functional<br>&gt; according image_id in /tmp folder, if e=
xisting then it's not allow to<br>&gt; update same image two times.<br>&gt;=
<br>&gt; However, after your commit then test script will fail due to image=
_id<br>&gt; dir be deleted. Did you have any suggestion for this symptom?<b=
r><br>Hi Tim,<br><br>Could you provide a bit more details about this test c=
ase, you hint that it may exist in the openbmc-test-automation repo?<br><br=
>The openbmc-test-automation handles this scenario by extracting the MANIFE=
ST file out of the code update tarball before the upload and reading the VE=
RSION string, then comparing that with the VERSION in the /etc/os-release f=
ile in the BMC to determine if the version is already running in the BMC.<b=
r><br>I wouldn't recommend trying to generate the id from within the test c=
ase because the algorithm may change. So hopefully checking the version str=
ing is an alternative that'd work.<br>________________________________<br>_=
_______________________________<br> The privileged confidential information=
 contained in this email is intended for use only by the addressees as indi=
cated by the original sender of this email. If you are not the addressee in=
dicated in this email or are not responsible for delivery of the email to s=
uch a person, please kindly reply to the sender indicating this fact and de=
lete all copies of it from your computer and network server immediately. Yo=
ur cooperation is highly appreciated. It is advised that any unauthorized u=
se of confidential information of Nuvoton is strictly prohibited; and any i=
nformation in this email irrelevant to the official business of Nuvoton sha=
ll be deemed as neither given nor endorsed by Nuvoton.<br><br></font></tt><=
br><br><BR>
</body></html>

--1__=8FBB0CB6DFABD94E8f9e8a93df938690918c8FBB0CB6DFABD94E--


--0__=8FBB0CB6DFABD94E8f9e8a93df938690918c8FBB0CB6DFABD94E
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=8FBB0CB6DFABD94E8f9e8a93df938690918c8FB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=8FBB0CB6DFABD94E8f9e8a93df938690918c8FBB0CB6DFABD94E--

