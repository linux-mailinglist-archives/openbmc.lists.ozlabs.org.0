Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F8258E506
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 04:59:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2ZRP5Kw3z3bc1
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 12:59:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=verizon.com header.i=@verizon.com header.a=rsa-sha256 header.s=corp header.b=AXs3Jm2j;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=verizon.com (client-ip=148.163.153.92; helo=mx0b-0024a201.pphosted.com; envelope-from=mruthyunjaya.rao.havaligi@verizon.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=verizon.com header.i=@verizon.com header.a=rsa-sha256 header.s=corp header.b=AXs3Jm2j;
	dkim-atps=neutral
X-Greylist: delayed 663 seconds by postgrey-1.36 at boromir; Wed, 10 Aug 2022 05:49:51 AEST
Received: from mx0b-0024a201.pphosted.com (mx0b-0024a201.pphosted.com [148.163.153.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2NvM56h8z2x9T
	for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2022 05:49:47 +1000 (AEST)
Received: from pps.filterd (m0127388.ppops.net [127.0.0.1])
	by mx0a-0024a201.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 279JS182013402
	for <openbmc@lists.ozlabs.org>; Tue, 9 Aug 2022 15:38:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verizon.com; h=mime-version : from
 : date : message-id : subject : to : content-type; s=corp;
 bh=u9OTia7T5bIy6zRnh+6gJWUlPiFFK/XBYYCCHKTrOqk=;
 b=AXs3Jm2jPaC6sjzk1j76/5eT79CK22u+FKWNaWB8JsbZFUNFOYZisGQBQ8i4kycmIaVb
 7rZhV54M/gSfUN6k8O41OcvKLJTnlCBeAwKQNKXOs5Sf6Qb1nkhGuVA8NMD+Hjz4TVhZ
 R9Fa2f+5OlB9qRy98ruFftLS5eawyqq+HkM= 
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0024a201.pphosted.com (PPS) with ESMTPS id 3huwrs055n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Tue, 09 Aug 2022 15:38:39 -0400
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-31f56f635a9so108437217b3.4
        for <openbmc@lists.ozlabs.org>; Tue, 09 Aug 2022 12:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=u9OTia7T5bIy6zRnh+6gJWUlPiFFK/XBYYCCHKTrOqk=;
        b=KaJdYSmt9UcnQq29JHG+vggJQT2dNoPxdxH9VKO+bRaPkkFs1Rh1Xjpu21HZLCFwX5
         oC4vw+K0aiRRrjtUKYBaYWAbF/bPxL+Cgr2Xb6Kjnh2Z1jJzh0U4WhUeeNJs4X3vavuy
         mUY+hoFMRZtOli3VIe2nIs6O6/v28v58KO/SDJpVu39sS3/K+eEaq5gT0JJFU2j2O+kD
         ZrFaWgrOu27SD3SCXXfcqvia+zQHGyPDOFu9DPF6gm4inzYmkcjCEUcbMeKWNAly+T+8
         HYt3JXCD64SlnRQo3RBKj2619a+mx546mGLyN53t1bmi8XSAsF7haxbgqeCrTYjPwt7c
         T0yQ==
X-Gm-Message-State: ACgBeo2kLoX+cNDAi07tfrW6fRp1S0D3UIsMBTEVTOzljcLFHZkHpxv/
	3aKy1HLpVYWDJN8TaqC9xSQfgh/aETnfGkwDCgM00oahswVeeMcS819ayITzTNv3fXOcT3OB8yJ
	HPrADWMrbAcH0McSXvwh7Vgw966ymdCnbTOA=
X-Received: by 2002:a25:e7d5:0:b0:67c:344e:532e with SMTP id e204-20020a25e7d5000000b0067c344e532emr2570509ybh.388.1660073919196;
        Tue, 09 Aug 2022 12:38:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5IPbwO+7Nra43UG2aluCtWBIEQGllIDwUbcvAQucaWqD2noC6kC1enymJRMV3/0sl8BBnyTzfYa8idlzdaa7o=
X-Received: by 2002:a25:e7d5:0:b0:67c:344e:532e with SMTP id
 e204-20020a25e7d5000000b0067c344e532emr2570477ybh.388.1660073918639; Tue, 09
 Aug 2022 12:38:38 -0700 (PDT)
MIME-Version: 1.0
From: "Havaligi, Mruthyunjaya Rao (Jay)" <mruthyunjaya.rao.havaligi@verizon.com>
Date: Tue, 9 Aug 2022 15:38:28 -0400
Message-ID: <CAO4fCV6xnz7L-DeDY6ioSmc8viEyL7J9kPKzgcBgrbx+V8f7aQ@mail.gmail.com>
Subject: Regarding OpenBmc filtering option
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000038c51805e5d4144a"
X-mailroute: internal
X-Proofpoint-GUID: xLesf-JyQD4-rg0eDQGwNtGpFssAFCKE
X-Proofpoint-ORIG-GUID: xLesf-JyQD4-rg0eDQGwNtGpFssAFCKE
X-Mailman-Approved-At: Wed, 10 Aug 2022 12:59:24 +1000
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

--00000000000038c51805e5d4144a
Content-Type: text/plain; charset="UTF-8"

Hi,

I am trying the filter option in openbmc (wht-0.91-0-gca8d06-ca8d06b) on
Qemu. I am not able to filter based on the Id. I see where the filtering
option was verified in this link -
https://gerrit.openbmc.org/c/openbmc/bmcweb/+/43505. Also, can I use ge, le
and other options too?

 curl -ku  x:x
'https:/x.x.x.x/redfish/v1/Managers/bmc/EthernetInterfaces?$expand=*'
{
  "@odata.id": "/redfish/v1/Managers/bmc/EthernetInterfaces",
  "@odata.type": "#EthernetInterfaceCollection.EthernetInterfaceCollection",
  "Description": "Collection of EthernetInterfaces for this Manager",
  "Members": [
    {
      "@odata.id": "/redfish/v1/Managers/bmc/EthernetInterfaces/eth0"
    },
    {
      "@odata.id": "/redfish/v1/Managers/bmc/EthernetInterfaces/eth1"
    }
  ],
  "Members@odata.count": 2,
  "Name": "Ethernet Network Interface Collection"
}
curl -ku xx:xx
https:/x.x.x.x/redfish/v1/Managers/bmc/EthernetInterfaces?$expand=*&$filter=Id
eq 'eth1'
curl: (52) Empty reply from server <<<



Thanks,
Jay

--00000000000038c51805e5d4144a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I am trying the filter option in op=
enbmc (wht-0.91-0-gca8d06-ca8d06b) on Qemu. I am not able to filter based o=
n the Id. I see where the filtering option was verified in this link -=C2=
=A0=C2=A0<a href=3D"https://gerrit.openbmc.org/c/openbmc/bmcweb/+/43505" ta=
rget=3D"_blank">https://gerrit.openbmc.org/c/openbmc/bmcweb/+/43505</a>. Al=
so, can I use ge, le and other options too?</div><div><br></div><div>=C2=A0=
curl -ku=C2=A0 x:x=C2=A0 &#39;https:/x.x.x.x/redfish/v1/Managers/bmc/Ethern=
etInterfaces?$expand=3D*&#39;<br>{<br>=C2=A0 &quot;@<a href=3D"http://odata=
.id/" target=3D"_blank">odata.id</a>&quot;: &quot;/redfish/v1/Managers/bmc/=
EthernetInterfaces&quot;,<br>=C2=A0 &quot;@odata.type&quot;: &quot;#Etherne=
tInterfaceCollection.EthernetInterfaceCollection&quot;,<br>=C2=A0 &quot;Des=
cription&quot;: &quot;Collection of EthernetInterfaces for this Manager&quo=
t;,<br>=C2=A0 &quot;Members&quot;: [<br>=C2=A0 =C2=A0 {<br>=C2=A0 =C2=A0 =
=C2=A0 &quot;@<a href=3D"http://odata.id/" target=3D"_blank">odata.id</a>&q=
uot;: &quot;/redfish/v1/Managers/bmc/EthernetInterfaces/eth0&quot;<br>=C2=
=A0 =C2=A0 },<br>=C2=A0 =C2=A0 {<br>=C2=A0 =C2=A0 =C2=A0 &quot;@<a href=3D"=
http://odata.id/" target=3D"_blank">odata.id</a>&quot;: &quot;/redfish/v1/M=
anagers/bmc/EthernetInterfaces/eth1&quot;<br>=C2=A0 =C2=A0 }<br>=C2=A0 ],<b=
r>=C2=A0 &quot;Members@odata.count&quot;: 2,<br>=C2=A0 &quot;Name&quot;: &q=
uot;Ethernet Network Interface Collection&quot;<br>}<br></div><div>curl -ku=
 xx:xx=C2=A0 https:/x.x.x.x/redfish/v1/Managers/bmc/EthernetInterfaces?$exp=
and=3D*&amp;$filter=3DId eq &#39;eth1&#39;<br>curl: (52) Empty reply from s=
erver &lt;&lt;&lt;</div><div><br></div><div><br></div><div><br></div><div>T=
hanks,</div><div>Jay</div><div><div><br></div></div><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><d=
iv></div></div></div><input name=3D"virtru-metadata" type=3D"hidden" value=
=3D"{&quot;email-policy&quot;:{&quot;state&quot;:&quot;closed&quot;,&quot;e=
xpirationUnit&quot;:&quot;days&quot;,&quot;disableCopyPaste&quot;:false,&qu=
ot;disablePrint&quot;:false,&quot;disableForwarding&quot;:false,&quot;enabl=
eNoauth&quot;:false,&quot;persistentProtection&quot;:false,&quot;expandedWa=
termarking&quot;:false,&quot;expires&quot;:false,&quot;isManaged&quot;:fals=
e,&quot;sms&quot;:false},&quot;attachments&quot;:{},&quot;compose-id&quot;:=
&quot;5&quot;,&quot;compose-window&quot;:{&quot;secure&quot;:false}}"></div=
>

--00000000000038c51805e5d4144a--
