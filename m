Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE98F2511EF
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 08:16:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbJfC2T16zDqTL
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 16:16:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=216.205.24.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=venkata_chandrappa@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=vyMBzRLT; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=vyMBzRLT; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbJcl5DfCzDqS9
 for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2020 16:15:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598336096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oKS2Pco0DR84Bb5/UtpsFKDD9OOuUmLkDzOSC75c/+s=;
 b=vyMBzRLTeyhHZrjFqEsUMmCgWu7qUhrN1srHjVqFNyyj98EA8Zef2qRnin+w7ysKLOVmzB
 WalYo2yIyVcipAlJZQL43HPq5IRO1rnKue96DIA37S3Pjvk4P4ZO2OkeB6yBpeTKDDzcAW
 RFPYl9hsTw88GnVQjM7PJb/M7Nh6EJk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598336096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oKS2Pco0DR84Bb5/UtpsFKDD9OOuUmLkDzOSC75c/+s=;
 b=vyMBzRLTeyhHZrjFqEsUMmCgWu7qUhrN1srHjVqFNyyj98EA8Zef2qRnin+w7ysKLOVmzB
 WalYo2yIyVcipAlJZQL43HPq5IRO1rnKue96DIA37S3Pjvk4P4ZO2OkeB6yBpeTKDDzcAW
 RFPYl9hsTw88GnVQjM7PJb/M7Nh6EJk=
Received: from TWN-EXCHMB-13.phoenix.com (123.51.168.5 [123.51.168.5])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-kc3VHnNpNsWJFQvAQykqaQ-1; Tue, 25 Aug 2020 02:14:53 -0400
X-MC-Unique: kc3VHnNpNsWJFQvAQykqaQ-1
X-CrossPremisesHeadersFilteredBySendConnector: TWN-EXCHMB-13.phoenix.com
Received: from TWN-EXCHMB-13.phoenix.com
 (2607:f0dc:5001:ff01:bd71:dee3:623a:a76a) by TWN-EXCHMB-13.phoenix.com
 (2607:f0dc:5001:ff01:bd71:dee3:623a:a76a) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Tue, 25 Aug 2020 14:14:50 +0800
Received: from TWN-EXCHMB-13.phoenix.com ([fe80::bd71:dee3:623a:a76a]) by
 TWN-EXCHMB-13.phoenix.com ([fe80::bd71:dee3:623a:a76a%12]) with mapi id
 15.00.1156.000; Tue, 25 Aug 2020 14:14:50 +0800
From: Venkata Chandrappa <Venkata_Chandrappa@phoenix.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Generate Crashdump log via Redfish
Thread-Topic: Generate Crashdump log via Redfish
Thread-Index: AdZ6pv2Jg/ytp56URfeA8Vl5TlOvPw==
Date: Tue, 25 Aug 2020 06:14:49 +0000
Message-ID: <1adc64abaca84bd899f61172a60de5b9@TWN-EXCHMB-13.phoenix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2607:f0dc:5001:ff01:c4ba:1913:25c8:c6b]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: TWN-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=venkata_chandrappa@phoenix.com
X-Mimecast-Spam-Score: 1.001999
X-Mimecast-Originator: phoenix.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
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

Got it. Thanks for the information!

-----Original Message-----
From: openbmc [mailto:openbmc-bounces+venkata_chandrappa=3Dphoenix.com@list=
s.ozlabs.org] On Behalf Of openbmc-request@lists.ozlabs.org
Sent: Thursday, August 20, 2020 9:12 AM
To: openbmc@lists.ozlabs.org
Subject: openbmc Digest, Vol 60, Issue 55

Send openbmc mailing list submissions to
=09openbmc@lists.ozlabs.org

To subscribe or unsubscribe via the World Wide Web, visit
=09https://lists.ozlabs.org/listinfo/openbmc
or, via email, send a message with subject or body 'help' to
=09openbmc-request@lists.ozlabs.org

You can reach the person managing the list at
=09openbmc-owner@lists.ozlabs.org

When replying, please edit your Subject line so it is more specific
than "Re: Contents of openbmc digest..."


Today's Topics:

   1. Re: Generate Crashdump log via Redfish (Bills, Jason M)
   2. BIOS Configuration (Ryan Chow)
   3. GUI Design Workgroup - BMCWeb login change (Joseph Reynolds)
   4. Re: GUI Design Workgroup - BMCWeb login change (Derick Montague)
   5. Re: GUI Design Workgroup - BMCWeb login change (Ed Tanous)
   6. Re:  RE:  Re: Network Settings GUI (rxsun)


----------------------------------------------------------------------

Message: 1
Date: Wed, 19 Aug 2020 11:38:50 -0700
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
To: openbmc@lists.ozlabs.org
Subject: Re: Generate Crashdump log via Redfish
Message-ID: <439e92d3-a9ae-8bf7-7edf-b9401dedea49@linux.intel.com>
Content-Type: text/plain; charset=3Dutf-8; format=3Dflowed



On 8/14/2020 7:02 AM, Venkata Chalapathy wrote:
> Hi Everyone,
>=20
> I?m looking for guidance on generating a crashdump log via the Redfish=20
> interface. There are two actions available to the user to generate the=20
> dump ? OnDemand and SendRawPeci. But I?m not aware of the payload data I=
=20
> need to be sending along with the request to generate the dump in either=
=20
> of the cases. Could you please share the payload that I need to attach=20
> to the request.
>=20
> "#Crashdump.OnDemand":?{
>=20
> "target":=20
> "/redfish/v1/Systems/system/LogServices/Crashdump/Actions/Oem/Crashdump.O=
nDemand"
>=20
>  ??????},
This is the OEM action to trigger the Intel crashdump application.=20
There is no payload required for this action.

It's on my list to move this to the new standard dump service "Create"=20
action when it's finalized.

>=20
> "#Crashdump.SendRawPeci":?{
>=20
> "target":=20
> "/redfish/v1/Systems/system/LogServices/Crashdump/Actions/Oem/Crashdump.S=
endRawPeci"
>=20
PECI is a communication protocol for BMC on Intel processors.  This is=20
an OEM action to send a PECI command to the CPU.  The payload is a=20
single "PECICommands" JSON object that is a double array of bytes where=20
each row is a raw PECI command.
{
     "PECICommands": [[48, 5, 9, 161, 0, 0, 0, 0],
                      [48, 5, 9, 161, 0, 0, 4, 0]]
}

We had proposed a standard Processor commands resource but the DMTF=20
rejected it and proposed we keep this as OEM.  We're still working out=20
how to handle it, but I'd like to make this standard as well.

> Best Regards,
>=20
> Venka
>=20


------------------------------

Message: 2
Date: Wed, 19 Aug 2020 15:12:08 -0400
From: Ryan Chow <kwongyhue.chow@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: BIOS Configuration
Message-ID:
=09<CABg4NFNhVXt59apmv331zRNXExvN23cS_vcNPddfVCQntPSCtw@mail.gmail.com>
Content-Type: text/plain; charset=3D"utf-8"

Hello,
I have seen some talk of remote BIOS configuration in the works, but I was
wondering if anyone can point me where I can start looking to configure the
BIOS locally. I would like to start by doing something relatively simple
such as setting the default boot mode to UEFI/Legacy.

Thanks,
Ryan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.ozlabs.org/pipermail/openbmc/attachments/20200819/419b5d=
25/attachment-0001.htm>

------------------------------

Message: 3
Date: Wed, 19 Aug 2020 17:41:45 -0500
From: Joseph Reynolds <jrey@linux.ibm.com>
To: Derick Montague <Derick.Montague@ibm.com>,
=09openbmc@lists.ozlabs.org
Subject: GUI Design Workgroup - BMCWeb login change
Message-ID: <6fd33e23-9845-ed74-7784-75a3a1439f1f@linux.ibm.com>
Content-Type: text/plain; charset=3Dutf-8; format=3Dflowed

On 8/19/20 8:55 AM, Derick Montague wrote:
>  =20
> Hello,
>    =20
> I apologize for the late notice. Here is the agenda for today's GUI Desig=
n Work Group.
>    =20
> - Changes to BMC Web Login and continued work on phosphor-webui

Derick, the "BMCWeb login change" [1] also came up in the security=20
working group meeting.? Folks were interested in getting the questions=20
answered rather more quickly.

What is the best way to resolve the issues?? Email?? Video conference??=20
IRC chat?? Or continue with the gerrit review?

- Joseph

[1]: https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/35457

> - Use utility classes
> - Discuss Server LED layout -https://github.com/openbmc/webui-vue/issues/=
18 =09
> - Discuss button styles on Local user management page - https://github.co=
m/openbmc/webui-vue/issues/12 =09Help wanted items
> - Design Review items
> - Demo of working Web UI progress
>    =20
>    =20
> Please visit the wiki for connection info and notes from past groups.
> https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group
>    =20
>  =20
> Thank you!
>    =20
> Derick Montague
> FED Lead | OpenBMC Design Team Lead
> IBM Cognitive Systems User Experience
>



------------------------------

Message: 4
Date: Wed, 19 Aug 2020 22:52:40 +0000
From: "Derick Montague" <Derick.Montague@ibm.com>
To: jrey@linux.ibm.com
Cc: openbmc@lists.ozlabs.org
Subject: Re: GUI Design Workgroup - BMCWeb login change
Message-ID:
=09<OFB642107F.4E5E7CE6-ON002585C9.007D46F4-002585C9.007DAC18@notes.na.coll=
abserv.com>
=09
Content-Type: text/plain; charset=3DUTF-8

> Derick, the "BMCWeb login change" [1] also came up in the security
> working group meeting.  Folks were interested in getting the questions
> answered rather more quickly.
=20
> What is the best way to resolve the issues?  Email?  Video conference?=20
> IRC chat?  Or continue with the gerrit review?

That is a great question for the community. We are trying to find a way to
accommodate this WITHOUT having to manage the login page in BMC Web. Maybe
we can gather a list of people that are interested and set up a Webex=20
discussion. We should probably post the question in IRC also to make the=20
request a bit broader than email.
=20



------------------------------

Message: 5
Date: Wed, 19 Aug 2020 16:06:15 -0700
From: Ed Tanous <ed@tanous.net>
To: Joseph Reynolds <jrey@linux.ibm.com>
Cc: Derick Montague <Derick.Montague@ibm.com>, OpenBMC Maillist
=09<openbmc@lists.ozlabs.org>
Subject: Re: GUI Design Workgroup - BMCWeb login change
Message-ID:
=09<CACWQX80KUxiRXtZv2Cd6UZ=3D0jTDKdg35JQFOfUAeFsss0kcg7Q@mail.gmail.com>
Content-Type: text/plain; charset=3D"UTF-8"

On Wed, Aug 19, 2020 at 3:43 PM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>
> What is the best way to resolve the issues?  Email?  Video conference?
> IRC chat?  Or continue with the gerrit review?

Gerrit or the mailing list, that way it's documented for the next time
it gets brought up, and we can point to the discussion later.


------------------------------

Message: 6
Date: Thu, 20 Aug 2020 09:11:29 +0800
From: "rxsun"<rxsun@zd-tech.com.cn>
To: "Derick Montague"<Derick.Montague@ibm.com>
Cc: "openbmc"<openbmc@lists.ozlabs.org>,
=09"derick.montague"<derick.montague@gmail.com>,
=09"xzcheng"<xzcheng@zd-tech.com.cn>,
=09"ratagupt"<ratagupt@linux.vnet.ibm.com>
Subject: Re:  RE:  Re: Network Settings GUI
Message-ID:
=09<3f858d5d.2facc1.174096bc131.Coremail.rxsun@zd-tech.com.cn>
Content-Type: text/plain; charset=3D"utf-8"

Hi , Derick!
I'd like to work on IPV6  functionality of phosphor-webui and start to impl=
iment it  on the phosphor-webui.
would you please show me  the design that was originally completed for the =
previous layout?

And ,how to proposal my code to webui project ?would you like to tell me de=
tail?

Best Reguards,
ruixia,sun



2020-08-19=20

rxsun=20



????"Derick Montague" <Derick.Montague@ibm.com>
?????2020-08-13 11:22
???RE: Re: Network Settings GUI
????"rxsun"<rxsun@zd-tech.com.cn>
???"openbmc"<openbmc@lists.ozlabs.org>,"derick.montague"<derick.montague@gm=
ail.com>,"xzcheng"<xzcheng@zd-tech.com.cn>,"ratagupt"<ratagupt@linux.vnet.i=
bm.com>

Hello ruxia, sun!

We have started work on the webui-vue GUI that will expect to be a replacem=
ent for phosphor-webui. The IPv6 functionality is not ready for the webui-v=
ue GUI because we are transitioning from the REST API to Redfish. If you ar=
e interested in adding the functionality to phosphor-webui, I can look for =
the design that was originally completed for the previous layout. Is that s=
omething you are interested in?

Thank you!

Derick Montague
FED Lead | OpenBMC Design Team Lead
IBM Cognitive Systems User Experience


----- Original message -----
From: "rxsun"<rxsun@zd-tech.com.cn>
To: "Derick Montague"<Derick.Montague@ibm.com>
Cc: "derick.montague"<derick.montague@gmail.com>, "openbmc"<openbmc@lists.o=
zlabs.org>, "ratagupt"<ratagupt@linux.vnet.ibm.com>, "???"<xzcheng@zd-tech.=
com.cn>
Subject: [EXTERNAL] Re: Re: Network Settings GUI
Date: Mon, Aug 10, 2020 3:04 AM
=20

Hi Derick,
My team has confirmed that the Openbmc backend has supported IPV6 on versio=
n v28, I am going to implement the ipv6 configuration in webui (with angula=
rJS),would you please tell me the  UX prototype design of webui for IPV6 is=
 ok? I have signed the  Cooperation and  Contribution License Agreement.
BTW:How to proposal my code to webui project ?would you like to tell me det=
ail?

Best Reguards,
ruixia,sun


2020-08-10=20

rxsun



????"Derick Montague" <Derick.Montague@ibm.com>
?????2020-03-11 19:42
???Re: Network Settings GUI
????"rxsun"<rxsun@zd-tech.com.cn>
???"derick.montague"<derick.montague@gmail.com>,"openbmc"<openbmc@lists.ozl=
abs.org>,"ratagupt"<ratagupt@linux.vnet.ibm.com>

Hi Ruxia,=20

> Sorry for late reply. I had read  https://gerrit.openbmc-project.xyz/c/op=
enbmc/phosphor-webui/+/24317  ,  I saw the calling of redfish  in api-ulti.=
js . I wonder if the ipv6 has been done in this BMC system.  Would you like=
 to tell me the ipv6 support schedule of  bmc OS?=20


 =20
Jandra is no longer working on this project and the IBM design team is work=
ing on a new version of the GUI written in Vue.js. We are just starting to =
talk about IPv6 again and I do think it may be ready. I see that Ratan is o=
n this mail thread and he should be able to specify for sure if the backend=
 supporting IPv6 is ready.=20

Thanks,=20
Derick=20

 =20


 =20
 =20
 =20
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.ozlabs.org/pipermail/openbmc/attachments/20200820/8016bf=
4f/attachment.htm>

End of openbmc Digest, Vol 60, Issue 55
***************************************

