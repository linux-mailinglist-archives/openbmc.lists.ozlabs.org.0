Return-Path: <openbmc+bounces-1316-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6F62L6+fgmlgWwMAu9opvQ
	(envelope-from <openbmc+bounces-1316-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Wed, 04 Feb 2026 02:23:59 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BA2E069A
	for <lists+openbmc@lfdr.de>; Wed, 04 Feb 2026 02:23:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5N0p2Rm1z2xpk;
	Wed, 04 Feb 2026 12:23:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::a2c" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770168234;
	cv=pass; b=RO8QU19xsms+CF4/BS9oQ3MDLyy0OvZUQ0qMBE8iuc78LHxGJrRq5aP9MY6xk+Z9nAzk8Hxw745xW5/dfrGJ8Y0q6FoTRG7V6DlIk3+sN2ND4lcln38FWEpq3FOhw8IMrWSO2kFyEAbRBBsHngrh7ACDn85yKh7rJfG5Z0IcvhN3vbfROQg97eFowsssSMuctMz3zmlik5MZ8WPT3r5WI0smcnZTJDb2vn9c5IrBx6mk/HawgJ5ptZ5/IyESqABXhtlg6U4tW9/GTgnniNpVjN1ycPWAI00pFusPfvG8gS0IYz9HObFEvg8KJ3GXFatO/DdzpXb/9bI8hTcsi+btVg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770168234; c=relaxed/relaxed;
	bh=MDlvuWkOV3fw8mwhWf+GvPudgUwJWRXk4QMAEKGkOvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ioqgly4m9HcU5X7rBJ52K4HSvco22D841KWolOvnBzznEiloyWA3zaNCfGGixbUFCAq9FvjmpeuH1Bs9WjDG5PeBchNhAXbCRNKd688dLBLxsP4M4Ewh71nD/zOKFPlCQ7ycIFFiR9YIR7ep+RsCVTbBrqkIDv0d8OhjeHw06wb+kouTP73DuYKgJ63sJXSvH7Eg/fcb8ZzxchIaTjMJrA8aDG83gbgclyklR0gGK2ahRwpg4tzfKChUQKDkDfNAGCzKnL+u6UXTGuIJoBZlIQqju4BpdrDRHe7AJn6kcWGdNWtiDjYuu+ZAAmu081r4uf+nHgX3l0FzjTs0q6iY1Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cCI5Brjg; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::a2c; helo=mail-vk1-xa2c.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cCI5Brjg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2c; helo=mail-vk1-xa2c.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5N0m12RQz2xJ5
	for <openbmc@lists.ozlabs.org>; Wed, 04 Feb 2026 12:23:51 +1100 (AEDT)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-563497c549cso3786264e0c.3
        for <openbmc@lists.ozlabs.org>; Tue, 03 Feb 2026 17:23:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770168228; cv=none;
        d=google.com; s=arc-20240605;
        b=CBG+JTKMoR8hmgRFivn6n+evQImsdAcC2vBGkH4S/toF0lLylDwrpDlOnFf3qKrFif
         LVbTu4oXv/xtMyUQreX9rUGbho4K/5R4XuxQEdqbGtrRNsoY6JArFEyJo2HCUVPoLNei
         fAO55Xt0DXZ1wSYVYmtZwFVhQ0gNQacOfwDC7DV/C9D9RFM5j3qY6Z7xJlLUtiPgGP7j
         LZEimA5/x4uFdTWLsMQ483Lye9//do5o2EOC+iVsPXtnt+msUZuFWcMgNedD4YNG2K2n
         B9U0QAQ8pRocb8jPBXbY3Uq9rcozCqwZ9eOmauJSFusXuEVPlESG+UdqF8Jzi2rZM0Ar
         B23Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MDlvuWkOV3fw8mwhWf+GvPudgUwJWRXk4QMAEKGkOvw=;
        fh=DuEq86bOGw/TJH0PqRISXQBaUjOgYPmkLRXQ9OwWDqU=;
        b=iCL4JJNGhN0OP/36HYf9UZ4I4YdFoKYkwOkoB/KjvVLC1brXlt5qR3cCtBblJzY5H2
         RRpdSvqh9bCq8GylSA754fdH2y4KdFtkvEgN41PqCaG8C8lXSx1gVp1aY9B2a1YkAv2S
         OOzPPuP2kMfa3dc1+bnfkDuEwrtw709hTNg+ZWefdLy2iSe0mktmeYfi7T3EdSKy6OTZ
         LswdufAM70Eaf2Z/Fgo8MgEIcYd8aCvYQ8O78+MDDRz6lanVDMWjPm43wEHjzK0eUSXT
         oFpz5B5DUxcRg042Fsnz9myktPGQkWNza+i6v2DUD+Ecf5dqgttCGGZh4LDJze1V0Ov5
         V1Dw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770168228; x=1770773028; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MDlvuWkOV3fw8mwhWf+GvPudgUwJWRXk4QMAEKGkOvw=;
        b=cCI5BrjgmYTUIXSbxNMSu4fK3y8WmhE6v/gA2Lv1L9I4+EuxPB9TqNNOcm2+VhzmQT
         9OwmAaTW87Li8QOcSPVq8KqK2pVBGmjhF5YetvzlqBweXeyVSNFZ2YOto7qyERjP7rfa
         7neyGQdWZyZ4E6P6nftX+e6QVTv2F1twKOM6YOzJf9EHEygeId39Nvt8jM16htRTiNQd
         cW54RO3LAC/b2VBbrr2AgOIA34QLAWgJO4QGwqDZyiZ3B+gZXWeOzJ5fqYPO7JovuwWb
         8pc+tLDtUGdTbz+PAigQUPzzWyX2PQnV2l6xQ8At1aTUs4wIgdqiVmkJe+KpQxQMk5Hz
         LnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770168228; x=1770773028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDlvuWkOV3fw8mwhWf+GvPudgUwJWRXk4QMAEKGkOvw=;
        b=RQiXF3GY+e0shXdvLyI/tkijrb0/t9ZX6JfBhOkzisVBlPC1EzOr/rpFOH8lE9axhy
         4kZT6YAtFN3ozO/Yv5q7G4uKhvvKy3lAQYM/sjVKAOGhxOO9VjyYPxfTDNQ3S5j0aJCn
         tTrarlyN/KpQgZ+6N/LFGI6HXlyWBRPnTmUgMLNR4FBofiWxw6u8vq3Medno6U1qSuY5
         +7CVvBasfXUtImVFfwf1vdl2MZUWC32IDS8GExgbrGDeAh97OINQTiSov49XPMOIV2qi
         Gre+Y6Fyt+a/Re6oeXbODPovlu0zS6wHMc3wfdDMyxFdztz0PnBjO5lkPq9HMnyvBboM
         8RRw==
X-Gm-Message-State: AOJu0Yx/YNIoTMv9iTJLYD2hj5q0v5P4j91C3rVEX2ej6i0v1r2U+ONN
	4jhodwpwyyuv5YqhJS/pXTLlOtq4if+mTSXITg3gdfcn5slJbSRqaKHpeI36BwMGjw7xP1AxA5u
	kvb8WJGAwWHuIGTc0sfnqaRBLrOY9uOU=
X-Gm-Gg: AZuq6aLaTA+1HpfAeuAfhUUATQrYWSZxjx1mz94QBHVOW3gcBrJRnFTT1Ulm63gAkm8
	Dk6jomWVfG5DAANZ8w2Pw8ZUrdcaM1PDma6T1keHKaoQqPXZfevYi65QJZo8j6hq/BrbXk7XRPQ
	fPE02ET/K1whMSi3PEIhdiTSakUfffbVHxi7L+Sop8ZWHs7JS1v6DHUKBgctsQNZ0ZSfwWbSfmO
	PCzXYXa22c7WQxPiIBUAXvu7ElEStXW9c3/EMISLkzmU79x4Jsh8+l1m6THSSCx6PTMH6+bNjju
	ROLXvhsatIpeOW0zjgv/qTEZNeij0nEHTlcuIN7EvDitPKbYIhiFB/Dck6jjOEenHElclkM6HpU
	GIKs1rJCg2LlQFrE=
X-Received: by 2002:a05:6123:14f:b0:566:2568:df1c with SMTP id
 71dfb90a1353d-566e800fd1amr489734e0c.7.1770168227756; Tue, 03 Feb 2026
 17:23:47 -0800 (PST)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <CYXPR12MB93185FD460BF55DC0279B0B796EEA@CYXPR12MB9318.namprd12.prod.outlook.com>
 <CYXPR12MB931837C7EBDACBD6666142C496D4A@CYXPR12MB9318.namprd12.prod.outlook.com>
 <CYXPR12MB93181BCE398A25D35049D2BC969BA@CYXPR12MB9318.namprd12.prod.outlook.com>
In-Reply-To: <CYXPR12MB93181BCE398A25D35049D2BC969BA@CYXPR12MB9318.namprd12.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 3 Feb 2026 19:23:32 -0600
X-Gm-Features: AZwV_QjIsfbwSiD_K1P_s8Dn9TO1YXvBl0lhG3aIESfH5iEjUWS-C127G0vVCSU
Message-ID: <CALLMt=oh4FDYHu1E4OuAgAE7V=6AYLAoBVW3hqYVn75X=LBXCw@mail.gmail.com>
Subject: Re: updated Schedule A of CCLA from AMD
To: "Venkatesh, Supreeth" <Supreeth.Venkatesh@amd.com>
Cc: openbmc <openbmc@lists.ozlabs.org>, "Chung, Andy" <Andy.Chung@amd.com>, 
	"TingYi.Fu@amd.com" <TingYi.Fu@amd.com>
Content-Type: multipart/alternative; boundary="000000000000687d4b0649f5682f"
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.20 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1316-lists,openbmc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[geissonator@gmail.com,openbmc@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Supreeth.Venkatesh@amd.com,m:openbmc@lists.ozlabs.org,m:Andy.Chung@amd.com,m:TingYi.Fu@amd.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geissonator@gmail.com,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ozlabs.org:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 07BA2E069A
X-Rspamd-Action: no action

--000000000000687d4b0649f5682f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 10:44=E2=80=AFAM Venkatesh, Supreeth <
Supreeth.Venkatesh@amd.com> wrote:

> [AMD Official Use Only - AMD Internal Distribution Only]
>
> Please find updated Schedule A of CCLA from AMD attached.
>
> Updated CCLA necessitated because of Schedule A change to add new members=
.
>

Thanks for keeping your CCLA updated. I've uploaded it to the projects
google drive.

Andrew


>
> *From:* Venkatesh, Supreeth <Supreeth.Venkatesh@amd.com>
> *Sent:* Thursday, November 20, 2025 10:36 AM
> *To:* openbmc <openbmc@lists.ozlabs.org>; Andrew Geissler <
> geissonator@gmail.com>
> *Cc:* Ye, Iris <Iris.Ye@amd.com>; Chiang, Bevis <Bevis.Chiang@amd.com>;
> Wang, Ryan <Ryan.Wang3@amd.com>; Lu, Brian <Brian.Lu@amd.com>; Albert,
> Jason <Jason.Albert@amd.com>; Lee, Ben (Engineering) <KaiWei.Lee@amd.com>=
;
> Ng, Ping Jie <PingJie.Ng@amd.com>; Cheng, Albin <Albin.Cheng@amd.com>;
> Kumar, Ashok2 <Ashok2.Kumar@amd.com>
> *Subject:* RE: updated Schedule A of CCLA from AMD
>
>
>
> *Caution:* This message originated from an External Source. Use proper
> caution when opening attachments, clicking links, or responding.
>
>
>
> [AMD Official Use Only - AMD Internal Distribution Only]
>
>
>
> Please find updated Schedule A of CCLA from AMD attached.
>
> Updated CCLA necessitated because of Schedule A change to add new members=
.
>
>
>
> Thanks,
>
> *Supreeth Venkatesh*
>
> System Manageability Architect  |*  AMD*
> Server Software
>
>
>

--000000000000687d4b0649f5682f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 3, =
2026 at 10:44=E2=80=AFAM Venkatesh, Supreeth &lt;<a href=3D"mailto:Supreeth=
.Venkatesh@amd.com">Supreeth.Venkatesh@amd.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg545554266259=
256066">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<p style=3D"font-family:Calibri;font-size:10pt;color:rgb(0,0,255);margin:5p=
t;font-style:normal;font-weight:normal;text-decoration:none" align=3D"Left"=
>
[AMD Official Use Only - AMD Internal Distribution Only]<br>
</p>
<br>
<div>
<div class=3D"m_545554266259256066WordSection1">
<p class=3D"MsoNormal">Please find updated Schedule A of CCLA from AMD atta=
ched.<u></u><u></u></p>
<p class=3D"MsoNormal">Updated CCLA necessitated because of Schedule A chan=
ge to add new members.<u></u><u></u></p>
</div></div></div></div></blockquote><div>=C2=A0</div><div>Thanks for keepi=
ng your CCLA updated. I&#39;ve uploaded it to the projects google drive.</d=
iv><div><br></div><div>Andrew</div><div><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div class=3D"msg545554266259256066"><div lang=3D"=
EN-US" style=3D"overflow-wrap: break-word;"><div><div class=3D"m_5455542662=
59256066WordSection1"><p class=3D"MsoNormal"></p><div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div style=3D"border-width:1pt medium medium;border-style:solid none none;b=
order-color:rgb(225,225,225) currentcolor currentcolor;padding:3pt 0in 0in"=
>
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:&quot;C=
alibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11pt;font=
-family:&quot;Calibri&quot;,sans-serif"> Venkatesh, Supreeth &lt;<a href=3D=
"mailto:Supreeth.Venkatesh@amd.com" target=3D"_blank">Supreeth.Venkatesh@am=
d.com</a>&gt;
<br>
<b>Sent:</b> Thursday, November 20, 2025 10:36 AM<br>
<b>To:</b> openbmc &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=
=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;; Andrew Geissler &lt;<a href=
=3D"mailto:geissonator@gmail.com" target=3D"_blank">geissonator@gmail.com</=
a>&gt;<br>
<b>Cc:</b> Ye, Iris &lt;<a href=3D"mailto:Iris.Ye@amd.com" target=3D"_blank=
">Iris.Ye@amd.com</a>&gt;; Chiang, Bevis &lt;<a href=3D"mailto:Bevis.Chiang=
@amd.com" target=3D"_blank">Bevis.Chiang@amd.com</a>&gt;; Wang, Ryan &lt;<a=
 href=3D"mailto:Ryan.Wang3@amd.com" target=3D"_blank">Ryan.Wang3@amd.com</a=
>&gt;; Lu, Brian &lt;<a href=3D"mailto:Brian.Lu@amd.com" target=3D"_blank">=
Brian.Lu@amd.com</a>&gt;; Albert, Jason &lt;<a href=3D"mailto:Jason.Albert@=
amd.com" target=3D"_blank">Jason.Albert@amd.com</a>&gt;; Lee, Ben (Engineer=
ing) &lt;<a href=3D"mailto:KaiWei.Lee@amd.com" target=3D"_blank">KaiWei.Lee=
@amd.com</a>&gt;; Ng, Ping Jie &lt;<a href=3D"mailto:PingJie.Ng@amd.com" ta=
rget=3D"_blank">PingJie.Ng@amd.com</a>&gt;;
 Cheng, Albin &lt;<a href=3D"mailto:Albin.Cheng@amd.com" target=3D"_blank">=
Albin.Cheng@amd.com</a>&gt;; Kumar, Ashok2 &lt;<a href=3D"mailto:Ashok2.Kum=
ar@amd.com" target=3D"_blank">Ashok2.Kumar@amd.com</a>&gt;<br>
<b>Subject:</b> RE: updated Schedule A of CCLA from AMD<u></u><u></u></span=
></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"left" widt=
h=3D"100%" style=3D"width:100%">
<tbody>
<tr>
<td style=3D"background:rgb(255,185,0);padding:5pt 2pt"></td>
<td width=3D"100%" style=3D"width:100%;background:rgb(255,248,229);padding:=
5pt 4pt 5pt 12pt">
<div>
<p class=3D"MsoNormal">
<b><span style=3D"color:rgb(34,34,34)">Caution:</span></b><span style=3D"co=
lor:rgb(34,34,34)"> This message originated from an External Source. Use pr=
oper caution when opening attachments, clicking links, or responding.
<u></u><u></u></span></p>
</div>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span><u></u>=C2=A0<u></u></span></p>
<div>
<p style=3D"margin:5pt"><span style=3D"font-size:10pt;font-family:&quot;Cal=
ibri&quot;,sans-serif;color:blue">[AMD Official Use Only - AMD Internal Dis=
tribution Only]<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span><u></u>=C2=A0<u></u></span></p>
<div>
<p class=3D"MsoNormal">Please find updated Schedule A of CCLA from AMD atta=
ched.<u></u><u></u></p>
<p class=3D"MsoNormal">Updated CCLA necessitated because of Schedule A chan=
ge to add new members.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif;color:black">Thanks,</span><span><u></u><u></u></span></=
p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">Supreeth Venkatesh</span></b><span><u></=
u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:&quot;Arial=
&quot;,sans-serif;color:black">System Manageability Architect=C2=A0=C2=A0|<=
b>=C2=A0=C2=A0AMD</b><br>
Server Software</span><span><u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
</div>
</div>
</div>

</div></blockquote></div></div>

--000000000000687d4b0649f5682f--

