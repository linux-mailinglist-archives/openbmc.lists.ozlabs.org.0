Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F26A61BF948
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 15:21:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Cbd63LlNzDrFJ
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 23:21:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=manojeda@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Cbbj3MgQzDr8D
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 23:20:28 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03UD2WT3131195
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 09:20:26 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.104])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mhc3mtk2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 09:20:26 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <manojeda@in.ibm.com>;
 Thu, 30 Apr 2020 13:20:26 -0000
Received: from us1b3-smtp06.a3dr.sjc01.isc4sb.com (10.122.203.184)
 by smtp.notes.na.collabserv.com (10.122.47.44) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 30 Apr 2020 13:20:23 -0000
Received: from us1b3-mail220.a3dr.sjc03.isc4sb.com ([10.160.174.232])
 by us1b3-smtp06.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020043013202309-437144 ;
 Thu, 30 Apr 2020 13:20:23 +0000 
In-Reply-To: 
Subject: SELinux UseCases
From: "Manojkiran Eda" <manojeda@in.ibm.com>
To: openbmc@lists.ozlabs.org, rnouse@google.com
Date: Thu, 30 Apr 2020 13:20:22 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-KeepSent: BBFB47E3:6EABAE1E-0025855A:00486BC9;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 55443
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 20043013-5525-0000-0000-0000026F07E5
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.413459; ST=0; TS=0; UL=0; ISC=; MB=0.378654
X-IBM-SpamModules-Versions: BY=3.00013003; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000293; SDB=6.01369952; UDB=6.00731875; IPR=6.01152304; 
 MB=3.00031944; MTD=3.00000008; XFM=3.00000015; UTC=2020-04-30 13:20:25
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-04-30 07:30:40 - 6.00011304
x-cbparentid: 20043013-5526-0000-0000-0000D0B50A70
Message-Id: <OFBBFB47E3.6EABAE1E-ON0025855A.00486BC9-0025855A.004946E0@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-30_08:2020-04-30,
 2020-04-30 signatures=0
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
Cc: ratagupt@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" style=3D"font-family=
:Arial, Helvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" ><div><span=
 style=3D"font-family:Verdana,Geneva,sans-serif;" >Hi All,</span></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >(My apologies =
for the lengthy email.)</span></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >Below are few =
use-cases in BMC, which i feel inclusion of SELinux would be a value add (t=
here could be may more missing). Please feel free to drop-in your comments/=
feedback.</span></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >1. BMC every a=
pplication runs a root (tops the security wish-list)<br>=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D</span></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >Assume that a =
malicious user compromises an application, say for example "bmcweb". The us=
er found a loophole in the webgui, and plants a php script through which he=
 can add a user with root privilege. This makes things easy as bmcweb is ru=
nning as root (and has sufficient rights to do it), which could result in s=
niffing or potentially could bring the server down.</span></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >- With SELinux=
, we can stop bmcweb from adding another user with root privilege, even whe=
n running as root. We should write a policy , so that bmcweb gets an access=
 denied when trying to edit /etc/passwd file.</span></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >Another classi=
c example of udev, where software must typically run as the root user to wr=
ite into raw block devices. In a traditional DAC-based Linux environment, i=
f the root user becomes compromised, that user can write to every raw block=
 device. However, SELinux can be used to label these devices so the process=
 assigned the root privilege can write to only those specified in the assoc=
iated policy.</span></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >For example, I=
BM uses nbd to offload the dumps to management console, as per the udev rul=
e mentioned any root user can write to the network block device, say an app=
lication which is running as root(bmcweb/ipmi) was compromised and it start=
s writing into the device , there by keeping it busy (because of which pldm=
 cannot write into the device , because of which hypervisor dumps cannot be=
 offloaded)</span></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >2. Every appli=
cation trusts every other running on the BMC system<br>=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span></div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >Assume there i=
s a weak code in ipmi, which got exploited and it tries to delete bmcweb=5F=
persistence.json (which contains the sessions x-auth token details and othe=
r confidential information).</span></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >- bmcweb=5Fper=
sistence.json will be loaded into bmcweb whenever it restarts, so that the =
sessions can be still valid even when bmcweb is crashed due to some reason.=
</span></div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >- In the curre=
nt state, no one can prevent compromised ipmi from deleting the file that b=
mcweb requires, with SELinux (using type enforcement mode), we can prevent =
ipmi from executing (or even stat on) bmcweb files.</span></div>
<div><br><span style=3D"font-family:Verdana,Geneva,sans-serif;" >3. We use =
SYSTEMD - We have SELINUX SYSTEMD ACCESS CONTROL<br>=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span></div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >As we know sys=
temd starts and stops all services, and users and processes communicate wit=
h systemd using the systemctl utility. The systemd daemon has the ability t=
o consult the SELinux policy and check the label of the calling process and=
 the label of the unit file that the caller tries to manage, and then get i=
t validated from SELinux whether or not the caller is allowed to access.</s=
pan></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >This approach =
strengthens access control to critical system capabilities, which include s=
tarting and stopping system services.</span></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >- Assume that =
a compromised ipmi running as root stops the bmcweb/network service, this w=
ould bring down the webserver/network. With SELinux, we can have a fine gra=
ined control policy to only allow ipmi to query the status of bmcweb, but c=
annot enable or disable the service.</span></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >4. We use JOUR=
NALD - We have SELINUX JOURNALD ACCESS CONTROL<br>=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span></div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >Say ipmid is c=
ompromised (it can be blocked from malfunctioning), but it also sends syslo=
g messages, SELinux would allow the compromised process to continue to send=
 those messages.</span></div>
<div><br><span style=3D"font-family:Verdana,Geneva,sans-serif;" >The compro=
mised ipmid could format syslog messages to match other daemons and potenti=
ally mislead an administrator, or even worse, a utility that reads the sysl=
og file into compromising the whole system.</span></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >- The systemd-=
journal daemon verifies all log messages and, among other things, adds SELi=
nux labels to them. It is then easy to detect inconsistencies in log messag=
es and prevent an attack of this type before it occurs.</span></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >5.1 Port Secur=
ity using SELinux<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span></div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >Using SELinux =
, It is possible to limit TCP port access to specific scripts/applications =
and block other applications from using them.</span></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >- For example,=
 bmcweb works on tcp port 443, what if another application which gets start=
ed before bmcweb acquires the same port and which causes the bmcweb to fail=
 acquiring the port.Using SELinux, we can label a process/application to a =
use a particular port.</span></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >5.2 Controllin=
g service acquisition with SELinux<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span></div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >Administrators=
 can enable within D-Bus to ensure that only well-established domains can a=
cquire a particular object within D-Bus.<br>&nbsp;</span></div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >- Without this=
 control, malicious code could register itself as being xyz.openbmc=5Fproje=
ct.Network, for instance, and pretend to be network system daemon on the bu=
s. Other applications might mistakenly send out sensitive information to th=
e application.</span></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >6. Governing D=
Bus message flows - Hardening the DBUS Communication<br>=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >Another contro=
l that D-Bus validates is which applications are allowed to communicate wit=
h each other. This is not configurable through the service configurations, =
but is a pure SELinux policy control.</span></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >- Whenever a s=
ource application is calling a method of a target application, D-Bus valida=
tes the send=5Fmsg permission between the two domains associated with the s=
ource and target applications and if these permissions are not in effect, t=
hen D-Bus will not allow the communication to happen.</span></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >- There by thi=
s selinux feature would restrict the ability of the dbus applications to sn=
iff the exposed interfaces of the other applications, even when they are ru=
nning as root.</span></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >7. Confining L=
inux Users abilities using SELinux<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >Users are mapp=
ed to the SELinux unconfined=5Fu user by default and all processes that are=
 run by unconfined=5Fu are in the unconfined=5Ft domain. This means that us=
ers can access across the system within the limits of the standard Linux DA=
C policy.</span></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >- However, a n=
umber of confined SELinux users are available in linux. This means that use=
rs can be restricted to limited set of capabilities. Each Linux user is map=
ped to an SELinux user using a policy, allowing Linux users to inherit the =
restrictions placed on SELinux users, for&nbsp; example (depending on the u=
ser),<br>we can restrict the user from :<br>&nbsp;-&nbsp; using networking<=
br>&nbsp;-&nbsp; run setuid applications (unless SELinux policy permits it)=
<br>&nbsp;-&nbsp; run the su and sudo commands.</span></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >When user logs=
-in, the pam=5Fselinux module maps the Linux user to an SELinux user , and =
sets up the resulting SELinux context. By using this feature, we can restri=
ct the permissions of even a root user by his login method.</span></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >For Example:<b=
r>=3D=3D=3D=3D=3D=3D=3D=3D<br>- By leveraging this feature, root logged-in =
via webserver will get only limited permissions , but the same root user lo=
gged in via ssh will get full permission.</span></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >8. Disable ptr=
ace()<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span></div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >The ptrace() s=
ystem call allows one process to observe and control the execution of anoth=
er process and change its memory and registers. This call is used primarily=
 by developers during debugging, for example when using the strace utility.=
 When ptrace() is not needed, it can be disabled to improve system security=
.</span></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >- With Selinux=
, we can disable ptrace() , which denies all processes, even those that are=
 running in unconfined=5Ft domains from being able to use ptrace() on other=
 processes</span></div>
<div>&nbsp;</div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >9. Restricting=
 on users capabilities for executing applications<br>=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D</span></div>
<div><span style=3D"font-family:Verdana,Geneva,sans-serif;" >-&nbsp; Not al=
lowing Linux users to execute applications (which inherit users' permission=
s) in their home directories and the /tmp directory, which they have write =
access to, helps prevent flawed or malicious applications((memory leaked)) =
from modifying files that users own/corrupt the system.</span></div>
<div><br><span style=3D"font-family:Verdana,Geneva,sans-serif;" >Regards,<b=
r>Manoj</span></div>
<div>&nbsp;</div></div></div></div><BR>

