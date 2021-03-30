Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9491734F410
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 00:13:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F93cK43jJz3c0D
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 09:13:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BAUbukPO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BAUbukPO; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F93c54WyVz2yxR
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 09:13:08 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12UM44VK142230
 for <openbmc@lists.ozlabs.org>; Tue, 30 Mar 2021 18:13:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : date : mime-version : references : content-transfer-encoding :
 content-type : message-id; s=pp1;
 bh=1iDIztCHoqB2ORRGS8D9LqQva4Jk8eksHwDRXosIvRQ=;
 b=BAUbukPOlEKG1Q+Og5U7EyngoNTKKeg1MSJjxtmYniaNlnAXpPxAcxlv00UFCWwd6xAJ
 q+WaVPv1C/+O56Z6HS6TBCH8rHvIrtFTvgGzCLbx3IRIhH3bu3t0pmyz+xGhZXWP1eDt
 KcliGpW6yX0o5yLpajAf9hBDAyVJWGYHVEk+PXotL3HWul/udieZeDC1TFBaqtsouGky
 RRNXT15eHb/dBu8ambiUDWSBsWXQYXUa2d2qmV5m9hSM0gd25gOGLY81ncfxzZgRJERV
 kmlW3WpdY4SlPgTFP1X0NA85bcx7O/2hiaj0VKzv1hst93h6UKBZBZH3LvZheGXHOxr4 4A== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.93])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37mb3gtcsy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 30 Mar 2021 18:13:06 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Tue, 30 Mar 2021 22:13:05 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 30 Mar 2021 22:13:04 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2021033022130413-721185 ;
 Tue, 30 Mar 2021 22:13:04 +0000 
In-Reply-To: 
Subject: GUI Design Work Group - Wednesday, 3/31/21 at 10:00 AM Cenral
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 30 Mar 2021 22:13:04 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP130 January 13, 2021 at 14:04
X-LLNOutbound: False
X-Disclaimed: 59371
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 21033022-8889-0000-0000-000004E3A760
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0;
 ST=0; TS=0; UL=0; ISC=; MB=0.000051
X-IBM-SpamModules-Versions: BY=3.00014940; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000296; SDB=6.01526390; UDB=6.00825223; IPR=6.01308321; 
 MB=3.00036522; MTD=3.00000008; XFM=3.00000015; UTC=2021-03-30 22:13:04
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-03-23 10:08:58 - 6.00012377
x-cbparentid: 21033022-8890-0000-0000-0000AF64A9E5
Message-Id: <OF7717BEC1.0F210BFD-ON002586A8.007A0BC0-002586A8.007A0BC5@notes.na.collabserv.com>
X-Proofpoint-ORIG-GUID: EAU1GkPIy9ntkTOV5nn1f_xiZLFs4aVx
X-Proofpoint-GUID: EAU1GkPIy9ntkTOV5nn1f_xiZLFs4aVx
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-30_12:2021-03-30,
 2021-03-30 signatures=0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"><font size=3D"2" face=3D"Default Monospace,Courier New,Courier,monos=
pace">Hello,<br><br>Please join us for the GUI Design Work Group if you are=
 interested in the following items:<br><br>- Round table discussion: Bring =
any topics that need discussion<br><br><br>If you have a topic, please feel=
 free to add it to the agenda, reply to this email, or mention me in the di=
scord channel (<a href=3D"https://discord.gg/wWU5rTcb" target=3D"=5Fblank">=
https://discord.gg/wWU5rTcb</a>).<br>&nbsp;<br>Meeting info: <a href=3D"htt=
ps://github.com/openbmc/openbmc/wiki/GUI-Design-work-group#meeting-info" ta=
rget=3D"=5Fblank">https://github.com/openbmc/openbmc/wiki/GUI-Design-work-g=
roup#meeting-info</a><br><br><br>Thank you!<br>&nbsp;<br>Derick Montague<br=
>IBM Cognitive Systems User Experience</font></font><BR>

