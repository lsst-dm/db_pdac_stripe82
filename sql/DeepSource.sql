-- MySQL dump 10.14  Distrib 5.5.47-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: gapon_SDRP_Stripe82
-- ------------------------------------------------------
-- Server version	5.5.47-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Final view structure for view `DeepSource`
--

/*!50001 DROP TABLE IF EXISTS `DeepSource`*/;
/*!50001 DROP VIEW IF EXISTS `DeepSource`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gapon`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `DeepSource` AS select `gapon_SDRP_Stripe82`.`RunDeepSource`.`id` AS `deepSourceId`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`parent` AS `parentDeepSourceId`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`coadd_id` AS `deepCoaddId`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`coadd_filter_id` AS `filterId`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`coord_ra` AS `ra`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`coord_decl` AS `decl`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`coord_raVar` AS `raVar`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`coord_declVar` AS `declVar`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`coord_radeclCov` AS `radeclCov`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`coord_htmId20` AS `htmId20`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`centroid_sdss_x` AS `x`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`centroid_sdss_y` AS `y`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`centroid_sdss_xVar` AS `xVar`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`centroid_sdss_yVar` AS `yVar`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`centroid_sdss_xyCov` AS `xyCov`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`flux_psf` AS `psfFlux`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`flux_psf_err` AS `psfFluxSigma`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`flux_sinc` AS `apFlux`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`flux_sinc_err` AS `apFluxSigma`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`multishapelet_combo_flux` AS `modelFlux`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`multishapelet_combo_flux_err` AS `modelFluxSigma`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`flux_gaussian` AS `instFlux`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`flux_gaussian_err` AS `instFluxSigma`,NULL AS `apCorrection`,NULL AS `apCorrectionSigma`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`shape_sdss_centroid_x` AS `shapeIx`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`shape_sdss_centroid_y` AS `shapeIy`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`shape_sdss_centroid_xVar` AS `shapeIxVar`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`shape_sdss_centroid_yVar` AS `shapeIyVar`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`shape_sdss_centroid_xyCov` AS `shapeIxIyCov`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`shape_sdss_Ixx` AS `shapeIxx`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`shape_sdss_Iyy` AS `shapeIyy`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`shape_sdss_Ixy` AS `shapeIxy`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`shape_sdss_IxxVar` AS `shapeIxxVar`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`shape_sdss_IyyVar` AS `shapeIyyVar`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`shape_sdss_IxyVar` AS `shapeIxyVar`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`shape_sdss_IxxIyyCov` AS `shapeIxxIyyCov`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`shape_sdss_IxxIxyCov` AS `shapeIxxIxyCov`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`shape_sdss_IxxIxyCov` AS `shapeIyyIxyCov`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`classification_extendedness` AS `extendedness`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`flags_negative` AS `flagNegative`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`flags_badcentroid` AS `flagBadMeasCentroid`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`flags_pixel_edge` AS `flagPixEdge`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`flags_pixel_interpolated_any` AS `flagPixInterpAny`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`flags_pixel_interpolated_center` AS `flagPixInterpCen`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`flags_pixel_saturated_any` AS `flagPixSaturAny`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`flags_pixel_saturated_center` AS `flagPixSaturCen`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`flux_psf_flags` AS `flagBadPsfFlux`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`flux_sinc_flags` AS `flagBadApFlux`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`multishapelet_combo_flux_flags` AS `flagBadModelFlux`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`flux_gaussian_flags` AS `flagBadInstFlux`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`centroid_sdss_flags` AS `flagBadCentroid`,`gapon_SDRP_Stripe82`.`RunDeepSource`.`shape_sdss_flags` AS `flagBadShape` from `RunDeepSource` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-19 23:37:44
